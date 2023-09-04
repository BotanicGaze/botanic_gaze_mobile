enum AspectType {
  eastFacing,
  northFacing,
  southFacing,
  westFacing,
}

extension AspectTypeX on AspectType {
  static final List<String> _titles = [
    'East-Facing',
    'North-Facing',
    'South-Facing',
    'West-Facing',
  ];
  static final List<int> _ids = [1, 2, 3, 4];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<AspectType> datasFromListId(List<int> ids) {
    final data = <AspectType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(AspectType.values[index]);
    }
    return data;
  }
}
