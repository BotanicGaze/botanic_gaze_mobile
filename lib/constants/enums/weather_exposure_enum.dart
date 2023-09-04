enum WeatherExposure {
  sheltered,
  exposed,
}

extension WeatherExposureX on WeatherExposure {
  static final List<String> _titles = ['Sheltered', 'Exposed'];
  static final List<int> _ids = [1, 2];

  // static final List<String> _images = [];

  String get title => _titles[index];
  int get id => _ids[index];
  // String get image => _images[index];

  static List<WeatherExposure> datasFromListId(List<int> ids) {
    final data = <WeatherExposure>[];
    for (final e in ids) {
      final index = _ids.indexOf(e);
      data.add(WeatherExposure.values[index]);
    }
    return data;
  }
}
