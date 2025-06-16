import 'dart:convert';

import 'package:path/path.dart';
import 'package:readeck_client/readeck_client.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;
  static const String dbName = 'readeck_offline.db';
  static const int dbVersion = 1;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, int version) async {
    // ブックマーク用テーブル
    await db.execute('''
      CREATE TABLE bookmarks (
        id TEXT PRIMARY KEY,
        title TEXT,
        url TEXT,
        content TEXT,
        excerpt TEXT,
        created_at TEXT,
        updated_at TEXT,
        labels TEXT,
        is_favorite INTEGER DEFAULT 0,
        sync_status INTEGER DEFAULT 0
      )
    ''');

    // ラベル用テーブル
    await db.execute('''
      CREATE TABLE labels (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        color TEXT,
        sync_status INTEGER DEFAULT 0
      )
    ''');

    // コレクション用テーブル
    await db.execute('''
      CREATE TABLE collections (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT,
        sync_status INTEGER DEFAULT 0
      )
    ''');

    // 保留中のアクション用テーブル（オフライン時の操作を保存）
    await db.execute('''
      CREATE TABLE pending_actions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        action_type TEXT NOT NULL,
        data TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }

  // ブックマーク関連
  static Future<void> saveBookmark(BookmarkSummary bookmark) async {
    final db = await database;
    await db.insert('bookmarks', {
      'id': bookmark.id,
      'title': bookmark.title,
      'url': bookmark.url,
      'excerpt': bookmark.description,
      'created_at': bookmark.created?.toIso8601String(),
      'updated_at': bookmark.updated?.toIso8601String(),
      'labels': bookmark.labels != null ? jsonEncode(bookmark.labels) : null,
      'is_favorite': bookmark.isMarked == true ? 1 : 0,
      'sync_status': 1, // 1 = synced
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> saveBookmarks(List<BookmarkSummary> bookmarks) async {
    final db = await database;
    final batch = db.batch();
    for (final bookmark in bookmarks) {
      batch.insert('bookmarks', {
        'id': bookmark.id,
        'title': bookmark.title,
        'url': bookmark.url,
        'excerpt': bookmark.description,
        'created_at': bookmark.created?.toIso8601String(),
        'updated_at': bookmark.updated?.toIso8601String(),
        'labels': bookmark.labels != null ? jsonEncode(bookmark.labels) : null,
        'is_favorite': bookmark.isMarked == true ? 1 : 0,
        'sync_status': 1,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit();
  }

  static Future<List<BookmarkSummary>> getBookmarks({
    int limit = 20,
    int offset = 0,
    String? query,
  }) async {
    final db = await database;
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (query != null && query.isNotEmpty) {
      whereClause = 'WHERE title LIKE ? OR url LIKE ? OR excerpt LIKE ?';
      whereArgs = ['%$query%', '%$query%', '%$query%'];
    }

    final List<Map<String, dynamic>> maps = await db.rawQuery(
      '''
      SELECT * FROM bookmarks 
      $whereClause
      ORDER BY created_at DESC 
      LIMIT ? OFFSET ?
    ''',
      [...whereArgs, limit, offset],
    );

    return maps.map((map) => _mapToBookmarkSummary(map)).toList();
  }

  static BookmarkSummary _mapToBookmarkSummary(Map<String, dynamic> map) {
    return BookmarkSummary(
      id: map['id'],
      title: map['title'],
      url: map['url'],
      description: map['excerpt'],
      created: map['created_at'] != null
          ? DateTime.parse(map['created_at'])
          : null,
      updated: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      labels: map['labels'] != null
          ? List<String>.from(jsonDecode(map['labels']))
          : null,
      isMarked: map['is_favorite'] == 1,
    );
  }

  // 個別のブックマークを取得
  static Future<BookmarkSummary?> getBookmark(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) return null;
    return _mapToBookmarkSummary(maps.first);
  }

  // ブックマークの詳細コンテンツを保存
  static Future<void> saveBookmarkContent(String id, String content) async {
    final db = await database;

    // まず該当ブックマークが存在するかチェック
    final existing = await db.query(
      'bookmarks',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (existing.isEmpty) {
      print('Cannot save content: bookmark $id not found in database');
      return;
    }

    final result = await db.update(
      'bookmarks',
      {'content': content},
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result > 0) {
      print(
        'Successfully saved content for bookmark $id: ${content.length} characters',
      );
    } else {
      print('Failed to update content for bookmark $id');
    }
  }

  // ブックマークの詳細コンテンツを取得
  static Future<String?> getBookmarkContent(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      columns: ['content'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) {
      print('No bookmark found with id: $id');
      return null;
    }

    final content = maps.first['content'];
    if (content == null || content.toString().isEmpty) {
      print('Bookmark $id exists but has no content');
      return null;
    }

    print(
      'Retrieved content for bookmark $id: ${content.toString().length} characters',
    );
    return content;
  }

  // ブックマークのコンテンツがキャッシュされているかチェック
  static Future<bool> hasBookmarkContent(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      columns: ['content'],
      where: 'id = ? AND content IS NOT NULL AND content != ""',
      whereArgs: [id],
      limit: 1,
    );

    final hasContent = maps.isNotEmpty;
    if (hasContent) {
      final content = maps.first['content'];
      final length = content?.toString().length ?? 0;
      print('hasBookmarkContent($id): true, length=$length');
    } else {
      print('hasBookmarkContent($id): false');
    }

    return hasContent;
  }

  // ブックマーク情報とコンテンツの両方があるかチェック
  static Future<bool> hasCompleteBookmarkData(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      columns: ['id', 'content'],
      where: 'id = ? AND content IS NOT NULL AND content != ""',
      whereArgs: [id],
      limit: 1,
    );
    return maps.isNotEmpty;
  }

  // 保留中のアクションを保存（オフライン時）
  static Future<void> savePendingAction(
    String actionType,
    Map<String, dynamic> data,
  ) async {
    final db = await database;
    await db.insert('pending_actions', {
      'action_type': actionType,
      'data': jsonEncode(data),
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // 保留中のアクションを取得
  static Future<List<Map<String, dynamic>>> getPendingActions() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'pending_actions',
      orderBy: 'created_at ASC',
    );
    return maps;
  }

  // 保留中のアクションを削除
  static Future<void> deletePendingAction(int id) async {
    final db = await database;
    await db.delete('pending_actions', where: 'id = ?', whereArgs: [id]);
  }

  // データベースをクリア
  static Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('bookmarks');
    await db.delete('labels');
    await db.delete('collections');
    await db.delete('pending_actions');
  }

  // ブックマーク削除
  static Future<void> deleteBookmark(String bookmarkId) async {
    final db = await database;
    await db.delete('bookmarks', where: 'id = ?', whereArgs: [bookmarkId]);
  }

  // ブックマーク更新
  static Future<void> updateBookmark(BookmarkSummary bookmark) async {
    final db = await database;
    await db.update(
      'bookmarks',
      {
        'title': bookmark.title,
        'url': bookmark.url,
        'excerpt': bookmark.description,
        'updated_at': bookmark.updated?.toIso8601String(),
        'labels': bookmark.labels != null ? jsonEncode(bookmark.labels) : null,
        'is_favorite': bookmark.isMarked == true ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [bookmark.id],
    );
  }

  // BookmarkInfoを保存（詳細情報）
  static Future<void> saveBookmarkInfo(BookmarkInfo bookmarkInfo) async {
    final db = await database;
    await db.insert('bookmarks', {
      'id': bookmarkInfo.id,
      'title': bookmarkInfo.title,
      'url': bookmarkInfo.url,
      'excerpt': bookmarkInfo.description,
      'created_at': bookmarkInfo.created?.toIso8601String(),
      'updated_at': bookmarkInfo.updated?.toIso8601String(),
      'labels': bookmarkInfo.labels != null
          ? jsonEncode(bookmarkInfo.labels)
          : null,
      'is_favorite': bookmarkInfo.isMarked == true ? 1 : 0,
      'sync_status': 1,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // デバッグ用：特定ブックマークの詳細情報を取得
  static Future<Map<String, dynamic>?> getBookmarkDebugInfo(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) {
      print('DEBUG: Bookmark $id not found in database');
      return null;
    }

    final bookmark = maps.first;
    final contentLength = bookmark['content']?.toString().length ?? 0;
    final hasContent =
        bookmark['content'] != null &&
        bookmark['content'].toString().trim().isNotEmpty;

    final debugInfo = {
      'id': bookmark['id'],
      'title': bookmark['title'],
      'url': bookmark['url'],
      'content_length': contentLength,
      'has_content': hasContent,
      'created_at': bookmark['created_at'],
      'sync_status': bookmark['sync_status'],
    };

    print('DEBUG: Bookmark $id info: $debugInfo');
    return debugInfo;
  }

  // デバッグ用：すべてのブックマークの概要を表示
  static Future<void> printAllBookmarksDebug() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('bookmarks');

    print('=== DATABASE DEBUG: ${maps.length} bookmarks ===');
    for (final bookmark in maps) {
      final contentLength = bookmark['content']?.toString().length ?? 0;
      final hasContent =
          bookmark['content'] != null &&
          bookmark['content'].toString().trim().isNotEmpty;
      print(
        '${bookmark['id']}: "${bookmark['title']}" content=${hasContent ? '✓' : '✗'}($contentLength chars)',
      );
    }
    print('=== END DATABASE DEBUG ===');
  }
}
