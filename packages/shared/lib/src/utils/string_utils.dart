import 'package:html/parser.dart';

extension StringExtensions on String {
  String plus(String other) {
    return this + other;
  }

  bool equalsIgnoreCase(String secondString) =>
      toLowerCase().contains(secondString.toLowerCase());

  String parseHtmlString() {
    final document = parse(this);
    final String? parsedString =
        parse(document.body?.text).documentElement?.text;

    return parsedString ?? '';
  }
}
