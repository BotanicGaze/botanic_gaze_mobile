import 'package:botanic_gaze/constants/index.dart';

enum AttributeType {
  foliage,
  stem,
  fruit,
  flower,
}

extension AttributeTypeX on AttributeType {
  static final List<String> _titles = [
    'Foliage',
    'Stem',
    'Fruit',
    'Flower',
  ];
  static final List<int> _ids = [1, 2, 3, 4];

  static final List<String> _images = [
    AppIcons.iconFoliage,
    AppIcons.iconStem,
    AppIcons.iconFruit,
    AppIcons.iconFlower,
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  String get image => _images[index];

  static List<AttributeType> datasFromListId(List<int> ids) {
    final data = <AttributeType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(AttributeType.values[index]);
    }
    return data;
  }

  static AttributeType? dataById(int? id) {
    if (id == null) return null;
    return AttributeType.values[_ids.indexOf(id)];
  }
}
