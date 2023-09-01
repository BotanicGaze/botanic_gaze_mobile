import 'package:shared/shared.dart';

enum PlantTypes {
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

extension PlantTypesX on PlantTypes {
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
    'Herbaceous\nPerennial',
    'Climber\nWall\nShrub',
    'Bedding',
    'Bulbs',
    'Ferns',
    'Shrubs',
    'Annual\nBiennial',
    'Alpine\nRockery',
    'Roses',
    'Grass\nLike',
    'Conservatory\nGreenhouse',
    'Fruit\nEdible',
    'Trees',
    'Houseplants',
    'Cactus\nSucculent',
    'Aquatic',
    'Bamboos',
    'Bogs',
    'Conifers',
    'Herbs\nCulinary',
    'Palms',
  ];

  int get id => _ids[index];
  String get title => _titles[index];
  String get imagePath =>
      'assets/images/plant_type/${ReCase(name).snakeCase}.png';

  static List<PlantTypes> dataFromId(List<int> ids) {
    final data = <PlantTypes>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(PlantTypes.values[index]);
    }
    return data;
  }
}
