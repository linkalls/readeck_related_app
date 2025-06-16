import 'dart:convert';
import 'dart:io'; // For HttpHeaders
import 'dart:typed_data'; // For Uint8List

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;

import 'exceptions.dart';
// Models are now imported via the barrel file
import 'models/models.dart';

/// A Dart client for interacting with the Readeck API.
///
/// Provides methods to access various Readeck functionalities including
/// authentication, bookmark management, label organization, annotations,
/// collections, and data import.
class ReadeckApiClient {
  /// The base URL of the Readeck API instance.
  final String baseUrl;
  String? _token;
  http.Client _httpClient;

  /// Creates a new instance of [ReadeckApiClient].
  ///
  /// [baseUrl] is the base URL of the Readeck API.
  /// [token] is an optional initial authentication token.
  /// [httpClient] is an optional HTTP client for testing purposes.
  ReadeckApiClient({
    required this.baseUrl,
    String? token,
    http.Client? httpClient,
  }) : _token = token,
       _httpClient = httpClient ?? http.Client();

  /// Sets the authentication token for subsequent API requests.
  void setToken(String token) {
    _token = token;
  }

  /// Clears the authentication token.
  void clearToken() {
    _token = null;
  }

  /// Prepares the HTTP headers for an API request.
  Map<String, String> _getHeaders({
    String? contentType = 'application/json; charset=utf-8',
    String accept = 'application/json',
  }) {
    final headers = <String, String>{
      if (contentType != null) HttpHeaders.contentTypeHeader: contentType,
      HttpHeaders.acceptHeader: accept,
    };
    if (_token != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
    }
    return headers;
  }

  /// Decodes the HTTP response body.
  dynamic _decodeResponse(http.Response response, {bool expectJson = true}) {
    if (response.bodyBytes.isEmpty) {
      return null;
    }
    if (expectJson) {
      try {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } catch (e) {
        throw ApiException(
          'Expected JSON response but failed to decode. Body: ${utf8.decode(response.bodyBytes)}',
          statusCode: response.statusCode,
          responseBody: utf8.decode(response.bodyBytes),
        );
      }
    }
    final contentTypeHeader = response.headers[HttpHeaders.contentTypeHeader];
    if (contentTypeHeader != null &&
        (contentTypeHeader.contains('text/html') ||
            contentTypeHeader.contains('text/markdown'))) {
      return utf8.decode(response.bodyBytes);
    }
    if (contentTypeHeader != null &&
        contentTypeHeader.contains('application/epub+zip')) {
      return response.bodyBytes;
    }
    return utf8.decode(response.bodyBytes);
  }

  /// Handles the HTTP response, checking for errors and decoding the body.
  Future<dynamic> _handleResponse(
    http.Response response, {
    bool expectJson = true,
  }) async {
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        !expectJson) {
      return _decodeResponse(response, expectJson: false);
    }

    dynamic decodedBody;
    if (expectJson ||
        (response.statusCode >= 400 && response.statusCode < 600)) {
      decodedBody = _decodeResponse(response, expectJson: true);
    } else {
      decodedBody = _decodeResponse(response, expectJson: false);
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedBody;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException(
        decodedBody is Map
            ? decodedBody['message'] ?? 'Unauthorized'
            : 'Unauthorized',
        responseBody: decodedBody,
      );
    } else if (response.statusCode == 403) {
      throw ForbiddenException(
        decodedBody is Map
            ? decodedBody['message'] ?? 'Forbidden'
            : 'Forbidden',
        responseBody: decodedBody,
      );
    } else if (response.statusCode == 404) {
      throw NotFoundException(
        decodedBody is Map
            ? decodedBody['message'] ?? 'Not Found'
            : 'Not Found',
        responseBody: decodedBody,
      );
    } else if (response.statusCode == 422) {
      final apiError = decodedBody is Map && decodedBody.containsKey('isValid')
          ? ApiError.fromJson(decodedBody.cast<String, dynamic>())
          : null;
      throw ValidationException(
        apiError?.message ??
            (decodedBody is Map
                ? decodedBody['message'] ?? 'Validation Error'
                : 'Validation Error'),
        errors: apiError?.fields?.map(
          (key, value) => MapEntry(key, value.errors ?? []),
        ),
        responseBody: decodedBody,
      );
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      throw InternalServerErrorException(
        decodedBody is Map
            ? decodedBody['message'] ?? 'Internal Server Error'
            : 'Internal Server Error',
        responseBody: decodedBody,
      );
    } else {
      throw ApiException(
        decodedBody is Map
            ? decodedBody['message'] ?? 'API Error'
            : 'API Error: ${response.statusCode}',
        statusCode: response.statusCode,
        responseBody: decodedBody,
      );
    }
  }

  /// Generic helper method to make an API request.
  Future<T> _makeRequest<T>(
    Future<http.Response> Function() requestFunction,
    T Function(dynamic body) fromBody, {
    bool expectJsonResponse = true,
  }) async {
    final response = await requestFunction();
    final dynamic body = await _handleResponse(
      response,
      expectJson: expectJsonResponse,
    );
    if (body == null && null is! T && expectJsonResponse) {
      throw ApiException(
        'Expected response body for ${T.toString()}, but received null',
        statusCode: response.statusCode,
      );
    }
    return fromBody(body);
  }

  Future<http.Response> _makeRawRequest(
    Future<http.Response> Function() requestFunction,
  ) async {
    final response = await requestFunction();
    bool expectJsonForError = response.statusCode >= 400;
    // Pass expectJsonForError, so if it's an error, it tries to parse as JSON.
    // If not an error, _handleResponse respects the passed expectJson which is false here by default for raw.
    // Corrected: _handleResponse should always try to parse errors as JSON.
    // The flag is more for the *success* path.
    await _handleResponse(response, expectJson: expectJsonForError);
    return response;
  }

  Future<void> _makeRequestVoidReturn(
    // Corrected name from _makeRequestNoResponse
    Future<http.Response> Function() requestFunction,
  ) async {
    final response = await requestFunction();
    await _handleResponse(response, expectJson: response.statusCode >= 400);
  }

  Future<http.Response> _makeMultipartRequest(
    String path,
    List<int> fileBytes,
    String fieldName,
    String filename, {
    MediaType? contentType,
  }) async {
    final uri = Uri.parse('$baseUrl/api$path');
    final request = http.MultipartRequest('POST', uri);

    final commonHeaders = _getHeaders(contentType: null);
    request.headers.addAll(commonHeaders);

    final multipartFile = http.MultipartFile.fromBytes(
      fieldName,
      fileBytes,
      filename: filename,
      contentType: contentType,
    );
    request.files.add(multipartFile);

    final streamedResponse = await _httpClient.send(request);
    return http.Response.fromStream(streamedResponse);
  }

  Map<String, String> _buildQueryParameters(Map<String, dynamic> params) {
    return params.entries
        .where((entry) {
          if (entry.key == 'labels') return true;
          return entry.value != null;
        })
        .map((entry) {
          if (entry.value is List) {
            return MapEntry(entry.key, (entry.value as List).join(','));
          }
          return MapEntry(entry.key, entry.value?.toString() ?? '');
        })
        .fold<Map<String, String>>({}, (map, entry) {
          // Only add if value is not empty OR if key is 'labels' (to allow 'labels=')
          if (entry.value.isNotEmpty || entry.key == 'labels') {
            map[entry.key] = entry.value;
          }
          return map;
        });
  }

  // --- Auth Endpoints ---
  Future<AuthResponse> login(AuthRequest authRequest) async {
    final authResponse = await _makeRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/auth'),
        headers: _getHeaders(),
        body: jsonEncode(authRequest.toJson()),
      ),
      (json) => AuthResponse.fromJson(json as Map<String, dynamic>),
    );

    if (authResponse.token != null) {
      setToken(authResponse.token!);
    }
    return authResponse;
  }

  Future<UserProfile> getProfile() async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/profile'),
        headers: _getHeaders(),
      ),
      (json) => UserProfile.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> logout() async {
    await _makeRequestVoidReturn(
      () => _httpClient.delete(
        Uri.parse('$baseUrl/api/auth'),
        headers: _getHeaders(),
      ),
    );
  }

  // --- Bookmark Endpoints ---
  Future<List<BookmarkSummary>> listBookmarks({
    String? search,
    String? title,
    String? author,
    String? site,
    List<String>? type,
    String? labels,
    bool? isLoaded,
    bool? hasErrors,
    bool? hasLabels,
    bool? isMarked,
    bool? isArchived,
    String? rangeStart,
    String? rangeEnd,
    List<String>? readStatus,
    String? id,
    String? collection,
    int? limit,
    int? offset,
  }) async {
    final queryParams = _buildQueryParameters({
      'search': search,
      'title': title,
      'author': author,
      'site': site,
      'type': type,
      'labels': labels,
      'is_loaded': isLoaded,
      'has_errors': hasErrors,
      'has_labels': hasLabels,
      'is_marked': isMarked,
      'is_archived': isArchived,
      'range_start': rangeStart,
      'range_end': rangeEnd,
      'read_status': readStatus,
      'id': id,
      'collection': collection,
      'limit': limit,
      'offset': offset,
    });
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse(
          '$baseUrl/api/bookmarks',
        ).replace(queryParameters: queryParams.isEmpty ? null : queryParams),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => BookmarkSummary.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Bookmarks API: Get a paginated list of bookmarks
  ///
  /// [limit] - Number of items per page
  /// [offset] - Pagination offset
  /// [sort] - List of sort keys (e.g. ['-created', 'title'])
  /// [search] - Full text search string
  /// [title] - Bookmark title
  /// [author] - Author's name
  /// [site] - Bookmark site name or domain
  /// [type] - List of bookmark types (article, photo, video)
  /// [labels] - One or several labels (comma-separated)
  /// [isLoaded] - Filter by loaded state
  /// [hasErrors] - Filter bookmarks with or without errors
  /// [hasLabels] - Filter bookmarks with or without labels
  /// [isMarked] - Filter by marked (favorite) status
  /// [isArchived] - Filter by archived status
  /// [rangeStart], [rangeEnd] - Range filter (string)
  /// [readStatus] - List of read progress status (unread, reading, read)
  /// [updatedSince] - Retrieve bookmarks created after this date
  /// [id] - One or more bookmark ID
  /// [collection] - A collection ID
  Future<List<BookmarkSummary>> getBookmarks({
    int? limit,
    int? offset,
    List<String>? sort,
    String? search,
    String? title,
    String? author,
    String? site,
    List<String>? type,
    String? labels,
    bool? isLoaded,
    bool? hasErrors,
    bool? hasLabels,
    bool? isMarked,
    bool? isArchived,
    String? rangeStart,
    String? rangeEnd,
    List<String>? readStatus,
    String? updatedSince,
    String? id,
    String? collection,
  }) async {
    return listBookmarks(
      limit: limit,
      offset: offset,
      search: search,
      title: title,
      author: author,
      site: site,
      type: type,
      labels: labels,
      isLoaded: isLoaded,
      hasErrors: hasErrors,
      hasLabels: hasLabels,
      isMarked: isMarked,
      isArchived: isArchived,
      rangeStart: rangeStart,
      rangeEnd: rangeEnd,
      readStatus: readStatus,
      id: id,
      collection: collection,
      // sort, updatedSinceはlistBookmarksに未対応なら今後拡張
    );
  }

  Future<List<BookmarkSync>> syncBookmarks() async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/sync'),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => BookmarkSync.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<BookmarkInfo> createBookmark(BookmarkCreate bookmarkCreate) async {
    final response = await _makeRawRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks'),
        headers: _getHeaders(),
        body: jsonEncode(bookmarkCreate.toJson()),
      ),
    );

    if (response.statusCode == 202) {
      final bookmarkId = response.headers['bookmark-id'];
      if (bookmarkId != null) {
        return getBookmark(bookmarkId);
      } else {
        final dynamic body = _decodeResponse(response, expectJson: true);
        throw ApiException(
          "Bookmark creation initiated (202), but no 'bookmark-id' header found.",
          statusCode: response.statusCode,
          responseBody: body,
        );
      }
    }
    final dynamic body = _decodeResponse(response, expectJson: true);
    if (body is Map<String, dynamic>) {
      return BookmarkInfo.fromJson(body);
    }
    throw ApiException(
      "Unexpected response after creating bookmark. Status: ${response.statusCode}, Body: $body",
      statusCode: response.statusCode,
      responseBody: body,
    );
  }

  Future<BookmarkInfo> getBookmark(String id) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/$id'),
        headers: _getHeaders(),
      ),
      (json) => BookmarkInfo.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<BookmarkUpdated> updateBookmark(
    String id,
    BookmarkUpdate bookmarkUpdate,
  ) async {
    return _makeRequest(
      () => _httpClient.patch(
        Uri.parse('$baseUrl/api/bookmarks/$id'),
        headers: _getHeaders(),
        body: jsonEncode(bookmarkUpdate.toJson()),
      ),
      (json) => BookmarkUpdated.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> deleteBookmark(String id) async {
    await _makeRequestVoidReturn(
      () => _httpClient.delete(
        Uri.parse('$baseUrl/api/bookmarks/$id'),
        headers: _getHeaders(),
      ),
    );
  }

  Future<String> getBookmarkArticle(String id) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/$id/article'),
        headers: _getHeaders(accept: 'text/html; charset=utf-8'),
      ),
      (body) => body as String,
      expectJsonResponse: false,
    );
  }

  Future<dynamic> exportBookmark(String id, String format) async {
    String acceptHeader;
    if (format == 'epub') {
      acceptHeader = 'application/epub+zip';
    } else if (format == 'md') {
      acceptHeader = 'text/markdown; charset=utf-8';
    } else {
      throw ArgumentError(
        'Unsupported format: $format. Must be "epub" or "md".',
      );
    }

    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/$id/article.$format'),
        headers: _getHeaders(accept: acceptHeader),
      ),
      (body) {
        if (format == 'epub' && body is Uint8List) return body;
        if (format == 'md' && body is String) return body;
        throw ApiException(
          "Received unexpected body type for format '$format'. Expected ${format == 'epub' ? 'Uint8List' : 'String'}, got ${body.runtimeType}",
          responseBody: body is Uint8List
              ? "Binary data (Uint8List)"
              : body.toString(),
        );
      },
      expectJsonResponse: false,
    );
  }

  Future<BookmarkShareLink> shareBookmarkLink(String id) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/$id/share/link'),
        headers: _getHeaders(),
      ),
      (json) => BookmarkShareLink.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<ApiMessage> shareBookmarkEmail(
    String id,
    BookmarkShareEmail shareEmailData,
  ) async {
    return _makeRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks/$id/share/email'),
        headers: _getHeaders(),
        body: jsonEncode(shareEmailData.toJson()),
      ),
      (json) => ApiMessage.fromJson(json as Map<String, dynamic>),
    );
  }

  // --- Label Endpoints ---
  Future<List<LabelInfo>> listLabels() async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/labels'),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => LabelInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<List<LabelInfo>> getLabelInfo(String name) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/labels/${Uri.encodeComponent(name)}'),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => LabelInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiMessage> updateLabel(String name, LabelUpdate labelUpdate) async {
    return _makeRequest(
      () => _httpClient.patch(
        Uri.parse('$baseUrl/api/bookmarks/labels/${Uri.encodeComponent(name)}'),
        headers: _getHeaders(),
        body: jsonEncode(labelUpdate.toJson()),
      ),
      (json) => ApiMessage.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> deleteLabel(String name) async {
    await _makeRequestVoidReturn(
      () => _httpClient.delete(
        Uri.parse('$baseUrl/api/bookmarks/labels/${Uri.encodeComponent(name)}'),
        headers: _getHeaders(),
      ),
    );
  }

  // --- Annotation (Highlight) Endpoints ---
  Future<List<AnnotationSummary>> listAnnotations({
    int? limit,
    int? offset,
  }) async {
    final queryParams = _buildQueryParameters({
      'limit': limit,
      'offset': offset,
    });
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse(
          '$baseUrl/api/bookmarks/annotations',
        ).replace(queryParameters: queryParams.isEmpty ? null : queryParams),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map(
            (item) => AnnotationSummary.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Future<List<AnnotationInfo>> listBookmarkAnnotations(
    String bookmarkId,
  ) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/$bookmarkId/annotations'),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => AnnotationInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<AnnotationInfo> createBookmarkAnnotation(
    String bookmarkId,
    AnnotationCreate annotationCreate,
  ) async {
    return _makeRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks/$bookmarkId/annotations'),
        headers: _getHeaders(),
        body: jsonEncode(annotationCreate.toJson()),
      ),
      (json) => AnnotationInfo.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<AnnotationUpdateResponse> updateBookmarkAnnotation(
    String bookmarkId,
    String annotationId,
    AnnotationUpdate annotationUpdate,
  ) async {
    return _makeRequest(
      () => _httpClient.patch(
        Uri.parse(
          '$baseUrl/api/bookmarks/$bookmarkId/annotations/$annotationId',
        ),
        headers: _getHeaders(),
        body: jsonEncode(annotationUpdate.toJson()),
      ),
      (json) => AnnotationUpdateResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> deleteBookmarkAnnotation(
    String bookmarkId,
    String annotationId,
  ) async {
    await _makeRequestVoidReturn(
      () => _httpClient.delete(
        Uri.parse(
          '$baseUrl/api/bookmarks/$bookmarkId/annotations/$annotationId',
        ),
        headers: _getHeaders(),
      ),
    );
  }

  // --- Collection Endpoints ---
  Future<List<CollectionInfo>> listCollections({
    int? limit,
    int? offset,
  }) async {
    final queryParams = _buildQueryParameters({
      'limit': limit,
      'offset': offset,
    });
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse(
          '$baseUrl/api/bookmarks/collections',
        ).replace(queryParameters: queryParams.isEmpty ? null : queryParams),
        headers: _getHeaders(),
      ),
      (json) => (json as List)
          .map((item) => CollectionInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<CollectionInfo> createCollection(
    CollectionCreateOrUpdate collectionCreate,
  ) async {
    return _makeRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks/collections'),
        headers: _getHeaders(),
        body: jsonEncode(collectionCreate.toJson()),
      ),
      (json) => CollectionInfo.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CollectionInfo> getCollectionInfo(String id) async {
    return _makeRequest(
      () => _httpClient.get(
        Uri.parse('$baseUrl/api/bookmarks/collections/$id'),
        headers: _getHeaders(),
      ),
      (json) => CollectionInfo.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<CollectionSummary> updateCollection(
    String id,
    CollectionCreateOrUpdate collectionUpdate,
  ) async {
    return _makeRequest(
      () => _httpClient.patch(
        Uri.parse('$baseUrl/api/bookmarks/collections/$id'),
        headers: _getHeaders(),
        body: jsonEncode(collectionUpdate.toJson()),
      ),
      (json) => CollectionSummary.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<void> deleteCollection(String id) async {
    await _makeRequestVoidReturn(
      () => _httpClient.delete(
        Uri.parse('$baseUrl/api/bookmarks/collections/$id'),
        headers: _getHeaders(),
      ),
    );
  }

  // --- Import Endpoints ---
  Future<ApiMessageWithLocation> _importMultipartFile(
    String pathSegment,
    List<int> fileBytes,
    String filename, {
    MediaType? fileContentType,
  }) async {
    final response = await _makeMultipartRequest(
      '/bookmarks/import/$pathSegment',
      fileBytes,
      'data',
      filename,
      contentType: fileContentType,
    );
    final dynamic jsonBody = _decodeResponse(response, expectJson: true);
    final location = response.headers['location'];
    if (location == null) {
      throw ApiException(
        "Import task accepted (202) but Location header missing.",
        statusCode: response.statusCode,
        responseBody: jsonBody,
      );
    }
    return ApiMessageWithLocation(
      message: ApiMessage.fromJson(jsonBody as Map<String, dynamic>),
      location: location,
    );
  }

  /// Imports bookmarks from a browser export file (HTML).
  /// [fileBytes] are the raw bytes of the HTML file.
  /// [filename] is the name of the file (e.g., "bookmarks.html").
  /// Returns an [ApiMessageWithLocation] containing the API message and the Location header of the import task.
  Future<ApiMessageWithLocation> importBrowserBookmarks(
    List<int> fileBytes,
    String filename,
  ) async {
    return _importMultipartFile(
      'browser',
      fileBytes,
      filename,
      fileContentType: MediaType('text', 'html'),
    );
  }

  /// Imports bookmarks from a Pocket export file (HTML).
  /// [fileBytes] are the raw bytes of the HTML file.
  /// [filename] is the name of the file (e.g., "ril_export.html").
  /// Returns an [ApiMessageWithLocation] containing the API message and the Location header of the import task.
  Future<ApiMessageWithLocation> importPocketFile(
    List<int> fileBytes,
    String filename,
  ) async {
    return _importMultipartFile(
      'pocket-file',
      fileBytes,
      filename,
      fileContentType: MediaType('text', 'html'),
    );
  }

  /// Imports bookmarks from a text file content.
  /// Corresponds to `POST /bookmarks/import/text`.
  /// Returns an [ApiMessageWithLocation] containing the API message and the Location header.
  Future<ApiMessageWithLocation> importTextFile(String textContent) async {
    final response = await _makeRawRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks/import/text'),
        headers: _getHeaders(
          contentType: 'text/plain; charset=utf-8',
          accept: 'application/json',
        ),
        body: textContent,
      ),
    );
    final dynamic jsonBody = _decodeResponse(response, expectJson: true);
    final location = response.headers['location'];
    if (location == null) {
      throw ApiException(
        "Import task accepted (202) but Location header missing.",
        statusCode: response.statusCode,
        responseBody: jsonBody,
      );
    }
    return ApiMessageWithLocation(
      message: ApiMessage.fromJson(jsonBody as Map<String, dynamic>),
      location: location,
    );
  }

  /// Imports bookmarks from a Wallabag instance.
  /// Corresponds to `POST /bookmarks/import/wallabag`.
  /// Returns an [ApiMessageWithLocation] containing the API message and the Location header.
  Future<ApiMessageWithLocation> importWallabag(
    WallabagImport wallabagImportData,
  ) async {
    final response = await _makeRawRequest(
      () => _httpClient.post(
        Uri.parse('$baseUrl/api/bookmarks/import/wallabag'),
        headers: _getHeaders(),
        body: jsonEncode(wallabagImportData.toJson()),
      ),
    );
    final dynamic jsonBody = _decodeResponse(response, expectJson: true);
    final location = response.headers['location'];
    if (location == null) {
      throw ApiException(
        "Import task accepted (202) but Location header missing.",
        statusCode: response.statusCode,
        responseBody: jsonBody,
      );
    }
    return ApiMessageWithLocation(
      message: ApiMessage.fromJson(jsonBody as Map<String, dynamic>),
      location: location,
    );
  }

  // --- Cookbook Endpoint ---

  /// Extracts content and metadata from a given URL.
  /// (Requires admin privileges on the server)
  ///
  /// Returns [ExtractionResult] if [acceptType] is 'application/json' (default).
  /// Returns HTML content as a [String] if [acceptType] is 'text/html'.
  Future<dynamic> extractLink(
    String url, {
    String acceptType = 'application/json',
  }) async {
    final queryParams = _buildQueryParameters({'url': url});
    final bool expectJson = acceptType == 'application/json';

    return _makeRequest(
      () => _httpClient.get(
        Uri.parse(
          '$baseUrl/api/cookbook/extract',
        ).replace(queryParameters: queryParams),
        headers: _getHeaders(accept: acceptType),
      ),
      (body) {
        if (expectJson) {
          return ExtractionResult.fromJson(body as Map<String, dynamic>);
        } else {
          return body as String; // Expected to be HTML string
        }
      },
      expectJsonResponse: expectJson,
    );
  }

  /// Closes the underlying HTTP client.
  /// This should be called when the API client is no longer needed.
  void dispose() {
    _httpClient.close();
  }
}

/// Helper class to encapsulate an [ApiMessage] and an optional [location] URL,
/// typically from a 'Location' header in 201 or 202 responses.
class ApiMessageWithLocation {
  /// The API message.
  final ApiMessage message;

  /// The URL from the 'Location' header, if present.
  final String? location;

  ApiMessageWithLocation({required this.message, this.location});
}
