enum Habit {
  bushy,
  climbing,
  clumpForming,
  columnarUpright,
  floating,
  matforming,
  pendulousWeeping,
  spreadingBranched,
  submerged,
  suckering,
  trailing,
  tufted,
}

extension HabitX on Habit {
  static final List<String> _titles = [
    'Bushy',
    'Climbing',
    'Clump forming',
    'Columnar upright',
    'Floating',
    'Matforming',
    'Pendulous weeping',
    'Spreading branched',
    'Submerged',
    'Suckering',
    'Trailing',
    'Tufted',
  ];
  static final List<int> _ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<Habit> datasFromListId(List<int> ids) {
    final data = <Habit>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(Habit.values[index]);
    }
    return data;
  }
}
