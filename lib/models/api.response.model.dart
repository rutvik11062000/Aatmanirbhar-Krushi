import 'package:json_annotation/json_annotation.dart';

part 'api.response.model.g.dart';

@JsonSerializable(nullable: false)
class ApiResponse {
  String id;
  GeoJson geo_json;
  String name;
  List<double> center;
  double area;
  String user_id;
  int created_at;

  ApiResponse(
      {this.id,
      this.geo_json,
      this.name,
      this.center,
      this.area,
      this.user_id,
      this.created_at});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
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
