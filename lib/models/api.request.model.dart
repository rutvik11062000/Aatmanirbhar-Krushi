import 'package:json_annotation/json_annotation.dart';

part 'api.request.model.g.dart';

@JsonSerializable(nullable: false)
class ApiRequest {
  String name;
  GeoJson geo_json;

  ApiRequest({this.name, this.geo_json});

  factory ApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRequestToJson(this);
}

@JsonSerializable(nullable: false)
class GeoJson {
  String type;
  Properties properties;
  Geometry geometry;

  GeoJson({this.type, this.properties, this.geometry});

  factory GeoJson.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonFromJson(json);

  Map<String, dynamic> toJson() => _$GeoJsonToJson(this);
}

@JsonSerializable(nullable: false)
class Properties {
  Properties({NULL});

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable(nullable: false)
class Geometry {
  String type;
  List<List> coordinates;

  Geometry({this.type, this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}
