import 'package:daisy/router/bottom_navbar/bottom_navbar_mixin.dart';
import 'package:daisy/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget with BottomNavbarMixin {
  BottomNavBar({required this.child, super.key}) {
    initializeBottomNavBarItems();
  }
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final index = RouterNotifier.instance.value;
    return Scaffold(
      key: rootScaffoldKey,
      body: child,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: index,
        onTap: (index) {
          popIfNecessary();
          onTap(index);
        },
        items: List.generate(
          bottomNavBarItems.length,
          (index) => bottomNavBarItems.values.elementAt(index),
        ),
      ),
    );
  }
}
