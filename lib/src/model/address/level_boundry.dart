///Levels of `from_bound` and `to_bound` according to
///Dadata online API documentation https://confluence.hflabs.ru/pages/viewpage.action?pageId=285343795.
enum LevelBoundryType { country, region, area, city, settlement, street, house }

/// Helper extension of [LevelBoundryType] enum.
extension LevelBoundryValue on LevelBoundryType? {
  /// Returns string value of a enum case.
  String? get value {
    switch (this) {
      case LevelBoundryType.country:
        return 'country';
      case LevelBoundryType.region:
        return 'region';
      case LevelBoundryType.area:
        return 'area';
      case LevelBoundryType.city:
        return 'city';
      case LevelBoundryType.settlement:
        return 'settlement';
      case LevelBoundryType.street:
        return 'street';
      case LevelBoundryType.house:
        return 'house';
      default:
        return null;
    }
  }

  /// Converts string [value] to enum case if available.
  /// Please check [LevelBoundryType] for available cases.
  static LevelBoundryType? forValue(String value) {
    switch (value) {
      case 'country':
        return LevelBoundryType.country;
      case 'region':
        return LevelBoundryType.region;
      case 'area':
        return LevelBoundryType.area;
      case 'city':
        return LevelBoundryType.city;
      case 'settlement':
        return LevelBoundryType.settlement;
      case 'street':
        return LevelBoundryType.street;
      case 'house':
        return LevelBoundryType.house;
      default:
        return null;
    }
  }
}
