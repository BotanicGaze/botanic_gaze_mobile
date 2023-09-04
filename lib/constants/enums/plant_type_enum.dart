import 'package:shared/shared.dart';

enum PlantType {
  herbaceousPerennial,
  climberWallShrub,
  bedding,
  bulbs,
  ferns,
  shrubs,
  annualBiennial,
  alpineRockery,
  roses,
  grassLike,
  conservatoryGreenhouse,
  fruitEdible,
  trees,
  houseplants,
  cactusSucculent,
  aquatic,
  bamboos,
  bogs,
  conifers,
  herbsCulinary,
  palms,
}

extension PlantTypesX on PlantType {
  static const List<int> _ids = [
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
    17,
    18,
    19,
    20,
    21
  ];
  static const List<String> _titles = [
    'Herbaceous Perennial',
    'Climber Wall Shrub',
    'Bedding',
    'Bulbs',
    'Ferns',
    'Shrubs',
    'Annual Biennial',
    'Alpine Rockery',
    'Roses',
    'Grass Like',
    'Conservatory Greenhouse',
    'Fruit Edible',
    'Trees',
    'Houseplants',
    'Cactus Succulent',
    'Aquatic',
    'Bamboos',
    'Bogs',
    'Conifers',
    'Herbs Culinary',
    'Palms',
  ];

  int get id => _ids[index];
  String get title => _titles[index];
  String get imagePath =>
      'assets/images/plant_type/${ReCase(name).snakeCase}.png';

  static List<PlantType> datasFromListId(List<int> ids) {
    final data = <PlantType>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(PlantType.values[index]);
    }
    return data;
  }
}
