// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_suggestion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSuggestionRequest _$AddressSuggestionRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['query'],
  );
  return AddressSuggestionRequest(
    json['query'] as String,
    count: json['count'] as int?,
    language: json['language'] as String?,
    constraints: (json['locations'] as List<dynamic>?)
        ?.map((e) =>
            AddressSuggestionConstraint.fromJson(e as Map<String, dynamic>))
        .toList(),
    radiusConstraints: (json['locations_geo'] as List<dynamic>?)
        ?.map((e) => AddressSuggestionRadiusConstraint.fromJson(
            e as Map<String, dynamic>))
        .toList(),
    locationsPriority: (json['locations_boost'] as List<dynamic>?)
        ?.map((e) =>
            AddressSuggestionPriority.fromJson(e as Map<String, dynamic>))
        .toList(),
    upperBoundary:
        $enumDecodeNullable(_$LevelBoundryTypeEnumMap, json['from_bound']),
    lowerBoundary:
        $enumDecodeNullable(_$LevelBoundryTypeEnumMap, json['to_bound']),
  )..location = (json['location'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$AddressSuggestionRequestToJson(
        AddressSuggestionRequest instance) =>
    <String, dynamic>{
      'query': instance.query,
      'count': instance.count,
      'language': instance.language,
      'locations': instance.constraints?.map((e) => e.toJson()).toList(),
      'locations_geo':
          instance.radiusConstraints?.map((e) => e.toJson()).toList(),
      'locations_boost':
          instance.locationsPriority?.map((e) => e.toJson()).toList(),
      'from_bound': instance.upperBoundary,
      'location': instance.location,
      'to_bound': instance.lowerBoundary,
    };

const _$LevelBoundryTypeEnumMap = {
  LevelBoundryType.country: 'country',
  LevelBoundryType.region: 'region',
  LevelBoundryType.area: 'area',
  LevelBoundryType.city: 'city',
  LevelBoundryType.settlement: 'settlement',
  LevelBoundryType.street: 'street',
  LevelBoundryType.house: 'house',
};
