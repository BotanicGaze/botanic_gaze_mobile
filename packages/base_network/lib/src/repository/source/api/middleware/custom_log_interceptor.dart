import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'base_interceptor.dart';

class CustomLogInterceptor extends BaseInterceptor {
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _startTime = DateTime.now();
    logPrint("*** API Request - Start ***");

    printKV("URI", options.uri);
    printKV("METHOD", options.method);
    logPrint("HEADERS:");
    options.headers.forEach((String key, v) => printKV(" - $key", v));
    logPrint("BODY:");
    printAll(options.data ?? "");

    logPrint("*** API Request - End ***");
    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    logPrint("*** Api Error - Start ***:");

    logPrint("URI: ${err.response?.realUri}");
    if (err.response != null) {
      logPrint("STATUS CODE: ${err.response?.statusCode?.toString()}");
    }
    logPrint("$err");
    if (err.response != null) {
      printKV("REDIRECT", err.response?.realUri);
      logPrint("BODY:");
      printAll(err.response?.toString());
    }

    logPrint("*** Api Error - End ***:");
    // return err;
    super.onError(err, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _endTime = DateTime.now();
    logPrint("*** Api Response - Start ***");
    int milliSeconds = _endTime.difference(_startTime).inMilliseconds;
    printKV("URI", response.realUri);
    printKV("STATUS CODE", response.statusCode);
    printKV("TIME REQUEST", "$milliSeconds ms");
    printKV("REDIRECT", response.isRedirect);
    logPrint("BODY:");
    printAll(
      json.encode(response.data).length > 500
          ? "${json.encode(response.data).substring(0, 500)} ..."
          : json.encode(response.data),
    );
    logPrint("*** Api Response - End ***");

    // return response;
    super.onResponse(response, handler);
  }

  void printKV(String key, Object? v) {
    logPrint("$key: $v");
  }

  void printAll(msg) {
    msg.toString().split("\n").forEach(logPrint);
  }

  void logPrint(String? message, {int? wrapWidth}) {
    final List<String> messageLines = message?.split("\n") ?? <String>["null"];
    if (wrapWidth != null) {
      _debugPrintBuffer.addAll(
        messageLines
            .expand<String>((String line) => debugWordWrap(line, wrapWidth)),
      );
    } else {
      _debugPrintBuffer.addAll(messageLines);
    }
    if (!_debugPrintScheduled) _debugPrintTask();
  }

  int _debugPrintedCharacters = 0;
  final int _kDebugPrintCapacity = 12 * 1024;
  final Duration _kDebugPrintPauseTime = const Duration(seconds: 1);
  final Queue<String> _debugPrintBuffer = Queue<String>();
  final Stopwatch _debugPrintStopwatch = Stopwatch();
  Completer<void>? _debugPrintCompleter;
  bool _debugPrintScheduled = false;

  void _debugPrintTask() {
    _debugPrintScheduled = false;
    if (_debugPrintStopwatch.elapsed > _kDebugPrintPauseTime) {
      _debugPrintStopwatch
        ..stop()
        ..reset();
      _debugPrintedCharacters = 0;
    }
    while (_debugPrintedCharacters < _kDebugPrintCapacity &&
        _debugPrintBuffer.isNotEmpty) {
      final String line = _debugPrintBuffer.removeFirst();
      _debugPrintedCharacters += line.length;
      print(
        // line
        '\x1B[37m$line\x1B[0m',
        // name: "DIO API"
      );
    }
    if (_debugPrintBuffer.isNotEmpty) {
      _debugPrintScheduled = true;
      _debugPrintedCharacters = 0;
      Timer(_kDebugPrintPauseTime, _debugPrintTask);
      _debugPrintCompleter ??= Completer<void>();
    } else {
      _debugPrintStopwatch.start();
      _debugPrintCompleter?.complete();
      _debugPrintCompleter = null;
    }
  }

  @override
  int get priority => BaseInterceptor.customLogPriority;
}
