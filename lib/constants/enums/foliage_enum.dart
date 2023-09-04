enum Foliage {
  deciduous,
  evergreen,
  semiEvergreen,
}

extension FoliageX on Foliage {
  static final List<String> _titles = [
    'Deciduous',
    'Evergreen',
    'Semi evergreen'
  ];
  static final List<int> _ids = [1, 2, 3];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<Foliage> datasFromListId(List<int> ids) {
    final data = <Foliage>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(Foliage.values[index]);
    }
    return data;
  }
}
