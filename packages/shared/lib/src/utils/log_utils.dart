import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:shared/src/config/log_config.dart';

enum Logger {
  black("30"),
  red("31"),
  green("32"),
  yellow("33"),
  blue("34"),
  magenta("35"),
  cyan("36"),
  white("37");

  final String code;
  const Logger(this.code);

  void log(dynamic text) => dev.log('\x1B[${code}m$text\x1B[0m');
}

class Log {
  const Log._();

  static const _enableLog = LogConfig.enableGeneralLog;

  static void d(
    Object? message, {
    String? name,
    DateTime? time,
  }) {
    _log(
      // '💡 $message',
      '\x1B[34m$message\x1B[0m',
      name: name ?? '',
      time: time,
    );
  }

  static void e(
    Object? errorMessage, {
    String? name,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _log(
      // '💢 $errorMessage',
      '\x1B[31m💢$errorMessage\x1B[0m',
      name: name ?? '',
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  static String prettyJson(Map<String, dynamic> json) {
    if (!LogConfig.isPrettyJson) {
      return json.toString();
    }

    final indent = '  ' * 2;
    final encoder = JsonEncoder.withIndent(indent);

    return encoder.convert(json);
  }

  static void _log(
    String message, {
    int level = 0,
    String name = '',
    DateTime? time,
    int? sequenceNumber,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_enableLog) {
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
