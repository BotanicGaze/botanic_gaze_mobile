enum MoistureType {
  wellDrained,
  poorlyDrained,
  moistButWellDrained,
}

extension MoistureX on MoistureType {
  static final List<String> _titles = [
    'Well–drained',
    'Poorly–drained',
    'Moist but well–drained',
  ];
  static final List<int> _ids = [1, 2, 3];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<MoistureType> datasFromListId(List<int> ids) {
    final data = <MoistureType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(MoistureType.values[index]);
    }
    return data;
  }
}
