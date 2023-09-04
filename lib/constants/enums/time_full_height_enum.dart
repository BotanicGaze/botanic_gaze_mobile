enum TimeFullHeight {
  from1Year,
  from1_2Years,
  from2_5Years,
  from5_10Years,
  from10_20Years,
  from20_50Years,
  moreThan_50Years,
}

extension TimeFullHeightX on TimeFullHeight {
  static final List<String> _titles = [
    '1 year',
    '1–2 years',
    '2–5 years',
    '5–10 years',
    '10–20 years',
    '20–50 years',
    'more than 50 years',
  ];
  static final List<int> _ids = [1, 2, 3, 4, 5, 6, 7];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<TimeFullHeight> datasFromListId(List<int> ids) {
    final data = <TimeFullHeight>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(TimeFullHeight.values[index]);
    }
    return data;
  }
}
