enum RepeatType { week, day, month }

extension RepeatTypeX on RepeatType {
  static final List<String> _names = [
    'week',
    'day',
    'month',
  ];

  String get name => _names[index];

  static RepeatType? dataFromId(String? name) {
    if (name == null) return null;
    return RepeatType.values[_names.indexOf(name)];
  }
}
