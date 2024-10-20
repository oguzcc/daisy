import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'lang_state.dart';

class LangCubit extends HydratedCubit<LangState> {
  LangCubit() : super(LangState.initial());

  Future<void> changeLocale(BuildContext context, Locale locale) async {
    context.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  @override
  LangState fromJson(Map<String, dynamic> json) => LangState.fromJson(json);

  @override
  Map<String, dynamic> toJson(LangState state) => state.toJson();
}
