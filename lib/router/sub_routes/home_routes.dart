import 'package:daisy/feature/home/view/home_screen.dart';
import 'package:daisy/router/screens.dart';
import 'package:go_router/go_router.dart';

sealed class HomeRoutes {
  static final routes = [
    GoRoute(
        path: Screens.home.path,
        name: Screens.home.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomeScreen()),
        routes: const []),
  ];
}
