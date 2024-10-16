import 'package:daisy/router/bottom_navbar/bottom_navbar_mixin.dart';
import 'package:daisy/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarStateful extends StatelessWidget with BottomNavbarMixin {
  BottomNavBarStateful({super.key, required this.navigationShell}) {
    initializeBottomNavBarItems();
  }
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final index = RouterNotifier.instance.value;
    return Scaffold(
      key: rootScaffoldKey,
      body: navigationShell,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: index,
        onTap: (index) {
          popIfNecessary();
          onTapStateful(navigationShell, index);
        },
        items: List.generate(
          bottomNavBarItems.length,
          (index) => bottomNavBarItems.values.elementAt(index),
        ),
      ),
    );
  }
}
