// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRequest _$ApiRequestFromJson(Map<String, dynamic> json) {
  return ApiRequest(
    name: json['name'] as String,
    geo_json: GeoJson.fromJson(json['geo_json'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiRequestToJson(ApiRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'geo_json': instance.geo_json,
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
