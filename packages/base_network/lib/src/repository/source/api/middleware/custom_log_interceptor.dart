import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

/// A simple dio log interceptor (mainly inspired by the built-in dio
/// `LogInterceptor`), which has coloring features and json formatting
/// so you can have a better readable output.
class CustomLogInterceptor implements Interceptor {
  /// Creates a colorful dio logging interceptor, which has the following:
  /// `requestStyle`: The request color style, defaults to `YELLOW`
  ///
  /// `responseStyle`: The response color style, defaults to `GREEN`
  ///
  /// `errorStyle`: The error response color style, defaults to `RED`
  ///
  /// `logRequestHeaders`: Whether to log the request headrers or not,
  /// it should minimize the logging output.
  ///
  /// `logResponseHeaders`: Whether to log the response headrers or not,
  /// it should minimize the logging output.
  ///
  /// `logRequestTimeout`: Whether to log the request timeout info or not,
  /// it should minimize the logging output.
  ///
  /// `logger`: if you want to override the default logger which is `log`,
  /// you can set any printer or logger you prefer.. just pass a refrence
  /// of your function to this function parameter and you're good to go.
  ///
  /// **Example**
  ///
  /// ```dart
  /// dio.interceptors.add(
  ///   AwesomeDioInterceptor(
  ///     logRequestTimeout: false,
  ///
  ///     // Optional, defaults to the 'log' function in the 'dart:developer'
  ///     // package
  ///     logger: debugPrint,
  ///   ),
  /// );
  /// ```
  CustomLogInterceptor({
    // Styles? requestStyle,
    // Styles? responseStyle,
    // Styles? errorStyle,
    bool logRequestHeaders = true,
    bool logResponseHeaders = true,
    bool logRequestTimeout = true,
    void Function(String log)? logger,
  })  : _jsonEncoder = const JsonEncoder.withIndent('  '),
        _logRequestHeaders = logRequestHeaders,
        _logResponseHeaders = logResponseHeaders,
        _logRequestTimeout = logRequestTimeout,
        _logger = logger ?? log;

  late final JsonEncoder _jsonEncoder;
  late final bool _logRequestHeaders;
  late final bool _logResponseHeaders;
  late final bool _logRequestTimeout;
  late final void Function(String log) _logger;

  void _log({required String key, required String value}) {
    String color = '\u001b[37;1m';
    String resetColor = '\u001b[0m';
    String name = 'DIO_LOGGER';
    // _logger('$color$key$value$resetColor');
    log('$color$key$value$resetColor', name: name);
  }

  void _logJson({
    required String key,
    dynamic value,
    bool isResponse = false,
  }) {
    final isFormData = value.runtimeType == FormData;
    final isValueNull = value == null;

    final encodedJson = _jsonEncoder.convert(
      isFormData ? Map.fromEntries((value as FormData).fields) : value,
    );
    _log(
      key: isResponse
          ? key
          : '${isFormData ? '[formData.fields]' : !isValueNull ? '[Json]' : ''} $key',
      value: encodedJson,
    );

    if (isFormData && !isResponse) {
      final files = (value as FormData)
          .files
          .map((e) => e.value.filename ?? 'Null or Empty filename')
          .toList();
      if (files.isNotEmpty) {
        final encodedJson = _jsonEncoder.convert(files);
        _log(
          key: '[formData.files] Request Body:\n',
          value: encodedJson,
        );
      }
    }
  }

  void _logHeaders({required Map headers}) {
    _log(key: 'Headers:', value: '');
    headers.forEach((key, value) {
      _log(
        key: '\t$key: ',
        value: (value is List && value.length == 1)
            ? value.first
            : value.toString(),
      );
    });
  }

  void _logNewLine() => _log(key: '', value: '');

  void _logRequest(
    RequestOptions options,
  ) {
    _log(key: '[Request] ->', value: '');
    _log(key: 'Uri: ', value: options.uri.toString());
    _log(key: 'Method: ', value: options.method);
    _log(
      key: 'Response Type: ',
      value: options.responseType.toString(),
    );
    _log(
      key: 'Follow Redirects: ',
      value: options.followRedirects.toString(),
    );
    if (_logRequestTimeout) {
      _log(
        key: 'Connection Timeout: ',
        value: options.connectTimeout.toString(),
      );
      _log(
        key: 'Send Timeout: ',
        value: options.sendTimeout.toString(),
      );
      _log(
        key: 'Receive Timeout: ',
        value: options.receiveTimeout.toString(),
      );
    }
    _log(
      key: 'Receive Data When Status Error: ',
      value: options.receiveDataWhenStatusError.toString(),
    );
    _log(
      key: 'Extra: ',
      value: options.extra.toString(),
    );
    if (_logRequestHeaders) {
      _logHeaders(
        headers: options.headers,
      );
    }
    _logJson(
      key: 'Request Body:\n',
      value: options.data,
    );
  }

  void _logResponse(Response response, {bool error = false}) {
    if (!error) {
      _log(
        key: '[Response] ->',
        value: '',
      );
    }
    _log(
      key: 'Uri: ',
      value: response.realUri.toString(),
    );
    _log(
      key: 'Request Method: ',
      value: response.requestOptions.method,
    );
    _log(
      key: 'Status Code: ',
      value: '${response.statusCode}',
    );
    if (_logResponseHeaders) {
      _logHeaders(
        headers: response.headers.map,
      );
    }
    _log(
      key: 'Response Body:\n',
      value: response.data.toString(),
      // isResponse: true,
    );
  }

  void _logError(
    DioError err,
  ) {
    _log(
      key: '[Error] ->',
      value: '',
    );
    _log(
      key: 'DioError: ',
      value: '[${err.type.toString()}]: ${err.message}',
    );
  }

  void _delay() async => await Future.delayed(
        const Duration(milliseconds: 200),
      );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logError(
      err,
    );
    if (err.response != null) {
      _logResponse(
        err.response!,
        error: true,
      );
    }
    _logNewLine();

    _delay();

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logRequest(
      options,
    );
    _logNewLine();

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    _logNewLine();

    handler.next(response);
  }
}
