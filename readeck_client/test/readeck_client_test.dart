import "package:readeck_client/readeck_client.dart";

void main() async {
  // 実際のAPIサーバーのURLを指定してください
  // 例: ローカルAPI
  const String baseUrl = 'https://readeck.spreadword.net';
  final ReadeckApiClient apiClient = ReadeckApiClient(baseUrl: baseUrl);
  final authRequest = AuthRequest(
    username: 'username', // ここに実際のユーザー名を入力
    password: 'password', // ここに実際のパスワードを入力
    application: 'TestApp', // アプリケーション名を指定
  );
  await apiClient.login(authRequest);

  print(await apiClient.getProfile());
  print(await apiClient.exportBookmark("74vk9x5izTBzzzAEGXRh1K", "md"));
  print(await apiClient.getBookmark("74vk9x5izTBzzzAEGXRh1K"));
  print("---");
  print(await apiClient.getBookmarkArticle("74vk9x5izTBzzzAEGXRh1K"));
  // var bookmarks = await apiClient.listBookmarks();
  // var file = File('bookmarks.txt');
  // await file.writeAsString(bookmarks.toString());
  // final a = await apiClient.getBookmarkArticle("74vk9x5izTBzzzAEGXRh1K");
  // print(a);
  // final bookmarks = await apiClient.getBookmarks(
  //   limit: 50,
  //   offset: 0,
  //   search: "flutter",
  // );
  // for (var bookmark in bookmarks) {
  //   print('${bookmark.id} - ${bookmark.title} - ${bookmark.url}');
  // }
  // // var result = await apiClient.exportBookmark('AePMJ12Mft3aGB1ZPAewNG', 'md');
  // // print(result);
  apiClient.dispose();

  // テストコードはここに追加します
}
