import 'package:botanic_gaze/constants/index.dart';

enum Sunlight {
  fullSun,
  partialShade,
  fullShade,
}

extension SunlightX on Sunlight {
  static final List<String> _titles = [
    'Full sun',
    'Partial shade',
    'Full shade',
  ];
  static final List<int> _ids = [1, 2, 3];

  static final List<String> _images = [
    AppImages.imageFullSun,
    AppImages.imageHalfShade,
    AppImages.imageFullShade,
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  String get image => _images[index];

  static List<Sunlight> datasFromListId(List<int> ids) {
    final data = <Sunlight>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(Sunlight.values[index]);
    }
    return data;
  }
}
