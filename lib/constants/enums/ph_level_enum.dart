import 'package:flutter/material.dart';

enum PHLevel {
  // strongAcid,
  acidic,
  // weakAcid,
  // slightlyAcidic,
  neutral,
  // slightlyAlkaline,
  // weakAlkaline,
  alkaline,
  // strongAlkaline,
}

extension PHLevelX on PHLevel {
  static final List<String> _titles = [
    // 'Strong Acid',
    // 'Strong Acid',
    // 'Acidic',
    'Acidic',
    // 'Weak Acid',
    // 'Weak Acid',
    // 'Slightly Acidic',
    'Neutral',
    // 'Slightly Alkaline',
    // 'Slightly Alkaline',
    // 'Weak Alkaline',
    // 'Weak Alkaline',
    // 'Alkaline',
    'Alkaline',
    // 'Strong Alkaline',
  ];
  static final List<int> _ids = [
    1,
    2,
    3,
    // 4,
    // 5,
    // 6,
    // 7,
    // 8,
    // 9,
    // 10,
    // 11,
    // 12,
    // 13,
    // 14
  ];

  static final List<Color> colors = [
    const Color(0xFFFF0000),
    const Color(0xFFFF0000),
    const Color(0xFFFFA500),
    const Color(0xFFFFA500),
    const Color(0xFFFFFF00),
    const Color(0xFFFFFF00),
    const Color(0xFFADFF2F),
    const Color(0xFF00FF00),
    const Color(0xFF20B2AA),
    const Color(0xFF20B2AA),
    const Color(0xFF0000FF),
    const Color(0xFF0000FF),
    const Color(0xFF800080),
    const Color(0xFF800080),
    const Color(0xFF8B008B),
  ];

  String get title => _titles[index];
  int get id => _ids[index];
  Color get color => colors[index];

  static List<PHLevel> datasFromListId(List<int> ids) {
    final data = <PHLevel>[];
    for (final e in ids) {
      // switch (e) {
      //   case 0:
      //   case 1:
      //     data.add(PHLevel.strongAcid);
      //   case 2:
      //   case 3:
      //     data.add(PHLevel.acidic);
      //   case 4:
      //   case 5:
      //     data.add(PHLevel.weakAcid);
      //   case 6:
      //     data.add(PHLevel.slightlyAcidic);
      //   case 7:
      //     data.add(PHLevel.neutral);
      //   case 8:
      //   case 9:
      //     data.add(PHLevel.slightlyAlkaline);
      //   case 10:
      //   case 11:
      //     data.add(PHLevel.weakAlkaline);
      //   case 12:
      //   case 13:
      //     data.add(PHLevel.alkaline);
      //   case 14:
      //     data.add(PHLevel.strongAlkaline);
      //   default:
      // }
      final index = _ids.indexOf(e);
      data.add(PHLevel.values[index]);
    }
    return data;
  }
}
