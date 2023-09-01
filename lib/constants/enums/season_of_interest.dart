import 'package:botanic_gaze/constants/index.dart';

enum SeasonOfInterest { spring, summer, autumn, winter }

extension SeasonOfInterestX on SeasonOfInterest {
  static final List<String> _titles = ['Spring', 'Summer', 'Autumn', 'Winter'];
  static final List<int> _ids = [1, 2, 3, 4];

  static final List<String> _images = [
    AppImages.imageSpring,
    AppImages.imageSummer,
    AppImages.imageAutumn,
    AppImages.imageWinter,
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  String get image => _images[index];

  static List<SeasonOfInterest> dataFromId(List<int> ids) {
    final data = <SeasonOfInterest>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(SeasonOfInterest.values[index]);
    }
    return data;
  }
}
