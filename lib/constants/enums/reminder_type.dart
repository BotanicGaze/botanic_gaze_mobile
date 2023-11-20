enum ReminderType { watering, misting, fertilizing, rotating }

extension ReminderTypeX on ReminderType {
  static final List<String> _names = [
    'watering',
    'misting',
    'fertilizing',
    'rotating',
  ];

  String get name => _names[index];

  static ReminderType? dataFromId(String? name) {
    if (name == null) return null;
    return ReminderType.values[_names.indexOf(name)];
  }
}
