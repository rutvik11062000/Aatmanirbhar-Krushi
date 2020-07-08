// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    id: json['id'] as String,
    geo_json: GeoJson.fromJson(json['geo_json'] as Map<String, dynamic>),
    name: json['name'] as String,
    center: (json['center'] as List).map((e) => (e as num).toDouble()).toList(),
    area: (json['area'] as num).toDouble(),
    user_id: json['user_id'] as String,
    created_at: json['created_at'] as int,
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'geo_json': instance.geo_json,
      'name': instance.name,
      'center': instance.center,
      'area': instance.area,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
    };

GeoJson _$GeoJsonFromJson(Map<String, dynamic> json) {
  return GeoJson(
    type: json['type'] as String,
    properties: Properties.fromJson(json['properties'] as Map<String, dynamic>),
    geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeoJsonToJson(GeoJson instance) => <String, dynamic>{
      'type': instance.type,
      'properties': instance.properties,
      'geometry': instance.geometry,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) {
  return Properties();
}

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{};

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
    type: json['type'] as String,
    coordinates: (json['coordinates'] as List).map((e) => e as List).toList(),
  );
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
