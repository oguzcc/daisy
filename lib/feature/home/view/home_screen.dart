import 'package:daisy/core/extension/string_extension.dart';
import 'package:daisy/localization/locale_keys/locale_keys.g.dart';
import 'package:flutter/material.dart';

part '../mixin/home_mixin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeMixin {
  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.common_home.t),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(LocaleKeys.common_home.t)],
        ),
      ),
    );
  }
}
