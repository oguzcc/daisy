// Dart core imports
import 'dart:async';
import 'dart:developer';

// Third-party package imports
import 'package:daisy/core/bloc/bloc_observer.dart';
import 'package:daisy/core/config/core_strings.dart';
import 'package:daisy/core/manager/local/language_manager.dart';
import 'package:daisy/core/manager/remote/sentry_client.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

// Local imports: Core

// Local imports: App setup
import 'listener.dart';
import 'locator.dart';
import 'provider.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Bloc.observer = const AppBlocObserver();

  // Error handling setup
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // App initialization
  await _initializeApp();

  // UI setup
  await _setupSystemUI();

  // Run app with Sentry integration
  await _runAppWithSentry(builder);
}

Future<void> _initializeApp() async {
  /// Ensure that widget bindings are initialized before initializing Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  /*
╔════════════════════╗
║   FIREBASE SETUP   ║
╚════════════════════╝
  */

  // Firebase setup
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseClient.initFirebaseMessaging();
  // final token = await FirebaseClient.getFcmToken();
  // log('FCM Token: $token');

  /*
╔═══════════════════════════════╗
║   HYDRATED BLOC INITIALIZE    ║
╚═══════════════════════════════╝
  */

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  /*
╔═══════════════════════════════╗
║   DB AND LOCALIZATION SETUP   ║
╚═══════════════════════════════╝
  */

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
}

/*
╔═════════════════════╗
║   System UI Setup   ║
╚═════════════════════╝
*/

Future<void> _setupSystemUI() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
}

Future<void> _runAppWithSentry(FutureOr<Widget> Function() builder) async {
  await SentryClient.init(
    dsn: CoreStrings.sentryDsn,
    appRunner: () async => runApp(
      EasyLocalization(
        path: LanguageManager.instance.path,
        supportedLocales: LanguageManager.instance.supportedLocales,
        useFallbackTranslations: true,
        startLocale: LanguageManager.instance.enLocale,
        fallbackLocale: LanguageManager.instance.fallbackLocale,
        child: MultiRepositoryProvider(
          providers: await locator(),
          child: MultiBlocProvider(
            providers: provider(),
            child: MultiBlocListener(
              listeners: listener(),
              child: await builder(),
            ),
          ),
        ),
      ),
    ),
  );
}
