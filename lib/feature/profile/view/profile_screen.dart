import 'package:daisy/core/extension/string_extension.dart';
import 'package:daisy/localization/locale_keys/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.common_profile.t),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(LocaleKeys.common_profile.t)],
        ),
      ),
    );
  }
}
