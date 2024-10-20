import 'package:daisy/core/config/app_flavor.dart';
import 'package:daisy/core/manager/storage/hive_client.dart';
import 'package:daisy/core/manager/storage/secure_storage_client.dart';
import 'package:daisy/core/manager/storage/shared_client.dart';
import 'package:daisy/core/manager/remote/dio_client.dart';
import 'package:daisy/data/repo/auth_repo.dart';
import 'package:daisy/data/service/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<RepositoryProvider<dynamic>>> locator({
  bool isMock = false,
}) async {
  final dio = Dio()..addSentry();

  const secureStorage = FlutterSecureStorage();
  final sharedPreferences = await SharedPreferences.getInstance();
  final hiveBox = await Hive.openBox<dynamic>(HiveKeys.box.name);
  // final socialLoginService = SocialLoginService();

  final providers = <RepositoryProvider<dynamic>>[
    RepositoryProvider<SecureStorageClient>(
      create: (context) => SecureStorageClient(secureStorage),
    ),
    RepositoryProvider<SharedClient>(
      create: (context) => SharedClient(sharedPreferences),
    ),
    RepositoryProvider<HiveClient>(
      create: (context) => HiveClient(hiveBox),
    ),
    RepositoryProvider<DioClient>(
      create: (context) =>
          DioClient(dio, AppFlavor.instance().apiOptions!, context),
    ),
    RepositoryProvider<IAuthRepo>(
        create: (context) => AuthRepo(context.read())),
    RepositoryProvider<IAuthService>(
        create: (context) => AuthService(context.read())),
  ];
  if (isMock) {
    return [];
  } else {
    return providers;
  }
}
