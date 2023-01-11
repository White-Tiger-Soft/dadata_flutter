import 'package:dadata/src/model/common/suggestion_request.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_suggestion_constraint.dart';
import 'address_suggestion_priority.dart';
import 'address_suggestion_radius_constraint.dart';
import 'level_boundry.dart';

part 'address_suggestion_request.g.dart';

/// Used to call address suggestions API.
@JsonSerializable(explicitToJson: true)
class AddressSuggestionRequest implements SuggestionRequest {
  @JsonKey(name: 'query', required: true)
  String query;

  @JsonKey(name: 'count')
  int? count;

  @JsonKey(name: 'language')
  String? language = 'ru';

  @JsonKey(name: 'locations')
  List<AddressSuggestionConstraint>? constraints;

  @JsonKey(name: 'locations_geo')
  List<AddressSuggestionRadiusConstraint>? radiusConstraints;

  @JsonKey(name: 'locations_boost')
  List<AddressSuggestionPriority>? locationsPriority;

  LevelBoundryType? _upperBoundary;
  LevelBoundryType? _lowerBoundary;
  String? _country;

  @JsonKey(name: 'from_bound')
  Map<String, String>? get upperBoundary {
    return {'value': '${_upperBoundary.value}'};
  }

  set upperBoundary(dynamic value) {
    if (value is String) {
      _upperBoundary = LevelBoundryValue.forValue(value);
      return;
    }
    if (value is LevelBoundryType) {
      _upperBoundary = value;
      return;
    }
    _upperBoundary = null;
  }

  @JsonKey(name: 'location')
  Map<String, String>? get location {
    return {'country': '${_country}'};
  }

  set location(dynamic value) {
    _country = value;
  }

  @JsonKey(name: 'to_bound')
  Map<String, String>? get lowerBoundary {
    return {'value': '${_lowerBoundary.value}'};
  }

  set lowerBoundary(dynamic value) {
    if (value is String) {
      _lowerBoundary = LevelBoundryValue.forValue(value);
      return;
    }
    if (value is LevelBoundryType) {
      _lowerBoundary = value;
    }
    _lowerBoundary = null;
  }

  /// AddressSuggestionRequest represents an serializable object
  /// used to perform suggestion queries.
  /// [query] is required field.
  /// [count] defaults to `10` and [language] defaults to `ru`.
  AddressSuggestionRequest(
    this.query, {
    this.count,
    this.language,
    this.constraints,
    this.radiusConstraints,
    this.locationsPriority,
    LevelBoundryType? upperBoundary,
    LevelBoundryType? lowerBoundary,
    String country = '*',
  })  : _upperBoundary = upperBoundary,
        _lowerBoundary = lowerBoundary,
        _country = country;

  factory AddressSuggestionRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressSuggestionRequestToJson(this);
}
