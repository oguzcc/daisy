import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

class SentryClient {
  static Future<void> init(
      {required String dsn, FutureOr<void> Function()? appRunner}) async {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = dsn
          ..tracesSampleRate = 1.0
          ..debug = kDebugMode;
      },
      appRunner: appRunner,
    );
  }

  static Future<void> func(VoidCallback func) async {
    try {
      func();
    } catch (exception, stackTrace) {
      debugPrint('SentryClient.captureException: $exception');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  static Future<T> funcWithReturnValue<T>(T Function() func) async {
    try {
      return func();
    } catch (exception, stackTrace) {
      debugPrint('SentryClient.captureException: $exception');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
