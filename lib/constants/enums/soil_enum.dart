import 'package:botanic_gaze/constants/index.dart';

enum SoilType {
  loam,
  chalk,
  sand,
  clay,
}

extension SoilTypeX on SoilType {
  static final List<String> _titles = ['Loam', 'Chalk', 'Sand', 'Clay'];
  static final List<int> _ids = [1, 2, 3, 4];

  static final List<String> _images = [
    AppImages.imageLoam,
    AppImages.imageChalk,
    AppImages.imageSand,
    AppImages.imageClay,
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  String get image => _images[index];

  static List<SoilType> dataFromId(List<int> ids) {
    final data = <SoilType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(SoilType.values[index]);
    }
    return data;
  }
}
