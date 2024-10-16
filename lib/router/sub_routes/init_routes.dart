import 'package:daisy/feature/splash/view/onboard_screen.dart';
import 'package:daisy/feature/splash/view/splash_screen.dart';
import 'package:daisy/router/screens.dart';
import 'package:go_router/go_router.dart';

sealed class InitRoutes {
  static final routes = [
    GoRoute(
      path: Screens.splash.path,
      name: Screens.splash.name,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
      redirect: (context, state) => Screens.home.path,
    ),
    GoRoute(
      path: Screens.onboard.path,
      name: Screens.onboard.name,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnboardScreen()),
    ),
  ];
}
