import 'package:daisy/core/extension/string_extension.dart';
import 'package:daisy/router/router.dart';
import 'package:daisy/router/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

mixin BottomNavbarMixin {
  late final Map<String, BottomNavigationBarItem> bottomNavBarItems;

  // just Add Screens and bottomNavBarItems in this method
  void initializeBottomNavBarItems() {
    bottomNavBarItems = <String, BottomNavigationBarItem>{
      Screens.home.path: bottomNavBarItem(
        icon: CupertinoIcons.home,
        label: Screens.home.name,
      ),
      Screens.profile.path: bottomNavBarItem(
        icon: CupertinoIcons.person,
        label: Screens.profile.name,
      ),
    };
  }

  BottomNavigationBarItem bottomNavBarItem(
          {required IconData icon, required String label}) =>
      BottomNavigationBarItem(icon: Icon(icon), label: label.overflow(12));

  void onTap(int index) {
    RouterNotifier.instance.update(index);
    goRouter.go(bottomNavBarItems.keys.toList()[index]);
  }

  // For stateful navigation
  void onTapStateful(StatefulNavigationShell navigationShell, int index) {
    RouterNotifier.instance.update(index);
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void popIfNecessary() {
    if (goRouter.canPop()) {
      goRouter.pop();
    }
  }
}
