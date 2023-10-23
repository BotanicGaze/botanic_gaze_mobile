enum RepeatType { week, day, month }

extension RepeatTypeX on RepeatType {
  static final List<String> _names = ['week', 'day', 'month'];

  String get name => _names[index];
}
