import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_models.freezed.dart';
part 'import_models.g.dart';

@freezed
abstract class WallabagImport with _$WallabagImport {
  const factory WallabagImport({
    required String url,
    required String username,
    required String password,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'client_secret') required String clientSecret,
  }) = _WallabagImport;

  factory WallabagImport.fromJson(Map<String, dynamic> json) =>
      _$WallabagImportFromJson(json);
}
