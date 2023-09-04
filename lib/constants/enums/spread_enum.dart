enum SpreadType {
  from0_0_0_1metre,
  form0_1_0_5Metres,
  form0_5_1Metres,
  form1_1_5Metres,
  form1_5_2_5Metres,
  form2_5_4Metres,
  form4_8Metres,
  widerThan_8Metres,
}

extension SpreadTypeX on SpreadType {
  static final List<String> _titles = [
    '0–0.1 metre',
    '0.1–0.5 metres',
    '0.5–1 metres ',
    '1–1.5 metres',
    '1.5–2.5 metres',
    '2.5–4 metres',
    '4–8 metres',
    'Wider than 8 metres',
  ];
  static final List<int> _ids = [1, 2, 3, 4, 5, 6, 7, 8];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<SpreadType> datasFromListId(List<int> ids) {
    final data = <SpreadType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(SpreadType.values[index]);
    }
    return data;
  }
}
