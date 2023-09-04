enum HeightType {
  upTo_10cm,
  from0_1_0_5Metres,
  from0_5_1Metres,
  from1_1_5Metres,
  from1_5_2_5Metres,
  from4_8Metres,
  from2_5_4Metres,
  from8_12Metres,
  higherThan_12Metres,
}

extension HeightTypeX on HeightType {
  static final List<String> _titles = [
    'Up to 10cm ',
    '0.1–0.5 metres ',
    '0.5–1 metres',
    '1–1.5 metres',
    '1.5–2.5 metres ',
    '4–8 metres',
    '2.5–4 metres ',
    '8–12 metres',
    'Higher than 12 metres ',
  ];
  static final List<int> _ids = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<HeightType> datasFromListId(List<int> ids) {
    final data = <HeightType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(HeightType.values[index]);
    }
    return data;
  }
}
