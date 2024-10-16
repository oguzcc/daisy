import 'package:daisy/feature/profile/view/profile_screen.dart';
import 'package:daisy/router/screens.dart';
import 'package:go_router/go_router.dart';

sealed class ProfileRoutes {
  static final routes = [
    GoRoute(
        path: Screens.profile.path,
        name: Screens.profile.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ProfileScreen()),
        routes: const []),
  ];
}
