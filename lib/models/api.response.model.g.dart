// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgroResponse _$AgroResponseFromJson(Map<String, dynamic> json) {
  return AgroResponse(
    id: json['id'] as String,
    geoJson: GeoJson.fromJson(json['geoJson'] as Map<String, dynamic>),
    name: json['name'] as String,
    center: (json['center'] as List).map((e) => (e as num).toDouble()).toList(),
    area: (json['area'] as num).toDouble(),
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$AgroResponseToJson(AgroResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'geoJson': instance.geoJson,
      'name': instance.name,
      'center': instance.center,
      'area': instance.area,
      'userId': instance.userId,
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
