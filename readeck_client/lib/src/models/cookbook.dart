import 'package:freezed_annotation/freezed_annotation.dart';

part 'cookbook.freezed.dart';
part 'cookbook.g.dart';

// Based on the schema for GET /cookbook/extract in docs/api/cookbook/routes.yaml

// Note: ExtractionLinkItemDetails was commented out in the prompt as it was part of a thought process.
// The actual implementation for 'link' and 'meta' in ExtractionProperties uses List<Map<String, String>>.

@freezed
abstract class ExtractionProperties with _$ExtractionProperties {
  const factory ExtractionProperties({
    @JsonKey(name: 'json-ld')
    List<Map<String, dynamic>>? jsonLd, // List of JSON-LD objects
    List<Map<String, String>>?
    link, // List of link attribute maps (each map is key-value, e.g. {"@rel":"...", "@href":"..."})
    List<Map<String, String>>?
    meta, // List of meta attribute maps (each map is key-value)
  }) = _ExtractionProperties;

  factory ExtractionProperties.fromJson(Map<String, dynamic> json) =>
      _$ExtractionPropertiesFromJson(json);
}

@freezed
abstract class ExtractionImageDetails with _$ExtractionImageDetails {
  const factory ExtractionImageDetails({
    List<int>? size, // [width, height]
    String? encoded, // base64 URI encoded image
  }) = _ExtractionImageDetails;

  factory ExtractionImageDetails.fromJson(Map<String, dynamic> json) =>
      _$ExtractionImageDetailsFromJson(json);
}

@freezed
abstract class ExtractionResult with _$ExtractionResult {
  const factory ExtractionResult({
    String? url,
    List<String>? logs,
    List<String>? errors,
    Map<String, List<String>>?
    meta, // "meta tags extracted", schema: {additionalProperties: {type: array, items: {type: string}}}
    ExtractionProperties? properties,
    String? domain,
    String? title,
    List<String>? authors,
    String? site,
    @JsonKey(name: 'site_name') String? siteName,
    String? lang,
    @JsonKey(name: 'text_direction') String? textDirection, // rtl, ltr
    DateTime? date,
    @JsonKey(name: 'document_type') String? documentType,
    String? description,
    String? html, // HTML content after processing
    String? embed, // oembed HTML fragment
    Map<String, ExtractionImageDetails>?
    images, // additionalProperties for dynamic image keys
  }) = _ExtractionResult;

  factory ExtractionResult.fromJson(Map<String, dynamic> json) =>
      _$ExtractionResultFromJson(json);
}
