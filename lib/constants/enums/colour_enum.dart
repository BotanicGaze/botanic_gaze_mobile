import 'package:flutter/material.dart';

enum ColourType {
  black,
  blue,
  bronze,
  brown,
  cream,
  green,
  grey,
  orange,
  pink,
  purple,
  red,
  silver,
  variegated,
  white,
  yellow,
  gold
}

extension ColourTypeX on ColourType {
  static final List<String> _titles = [
    'black',
    'blue',
    'bronze',
    'brown',
    'cream',
    'green',
    'grey',
    'orange',
    'pink',
    'purple',
    'red',
    'silver',
    'variegated',
    'white',
    'yellow',
    'gold'
  ];
  static final List<int> _ids = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
  ];

  static final List<Color> _colors = [
    const Color(0xFF3b3630),
    const Color(0xFF2d72d5),
    const Color(0xFFd99500),
    const Color(0xFF854800),
    const Color(0xFFfffbc4),
    const Color(0xFF348b57),
    const Color(0xFFaaaaaa),
    const Color(0xFFf55a00),
    const Color(0xFFff61ac),
    const Color(0xFF7b22d8),
    const Color(0xFFcd0304),
    const Color(0xFFadadad),
    Colors.transparent,
    const Color(0xFFffffff),
    const Color(0xFFfff903),
    const Color(0xFFdbb800),
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  Color get color => _colors[index];

  static List<ColourType> datasFromListId(List<int> ids) {
    final data = <ColourType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(ColourType.values[index]);
    }
    return data;
  }

  static ColourType? dataById(int? id) {
    if (id == null) return null;
    try {
      return ColourType.values[_ids.indexOf(id)];
    } catch (e) {
      print(id);
    }
    return null;
  }
}
