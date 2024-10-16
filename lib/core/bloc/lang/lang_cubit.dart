import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'lang_cubit.freezed.dart';
part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(const LangState());

  Future<void> changeLocale(BuildContext context, String locale) async {
    context.setLocale(Locale(locale));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);

    emit(state.copyWith(locale: Locale(locale)));
  }

  Future<void> initLocale(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final locale = prefs.getString('locale') ?? 'en';
    if (context.mounted) {
      await context.setLocale(Locale(locale));
    }

    emit(state.copyWith(locale: Locale(locale)));
  }
}
