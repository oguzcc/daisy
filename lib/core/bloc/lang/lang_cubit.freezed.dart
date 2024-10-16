// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lang_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LangState {
  Locale get locale => throw _privateConstructorUsedError;

  /// Create a copy of LangState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LangStateCopyWith<LangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangStateCopyWith<$Res> {
  factory $LangStateCopyWith(LangState value, $Res Function(LangState) then) =
      _$LangStateCopyWithImpl<$Res, LangState>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class _$LangStateCopyWithImpl<$Res, $Val extends LangState>
    implements $LangStateCopyWith<$Res> {
  _$LangStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LangState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LangStateImplCopyWith<$Res>
    implements $LangStateCopyWith<$Res> {
  factory _$$LangStateImplCopyWith(
          _$LangStateImpl value, $Res Function(_$LangStateImpl) then) =
      __$$LangStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$LangStateImplCopyWithImpl<$Res>
    extends _$LangStateCopyWithImpl<$Res, _$LangStateImpl>
    implements _$$LangStateImplCopyWith<$Res> {
  __$$LangStateImplCopyWithImpl(
      _$LangStateImpl _value, $Res Function(_$LangStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LangState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$LangStateImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LangStateImpl implements _LangState {
  const _$LangStateImpl({this.locale = const Locale('en')});

  @override
  @JsonKey()
  final Locale locale;

  @override
  String toString() {
    return 'LangState(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LangStateImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of LangState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LangStateImplCopyWith<_$LangStateImpl> get copyWith =>
      __$$LangStateImplCopyWithImpl<_$LangStateImpl>(this, _$identity);
}

abstract class _LangState implements LangState {
  const factory _LangState({final Locale locale}) = _$LangStateImpl;

  @override
  Locale get locale;

  /// Create a copy of LangState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LangStateImplCopyWith<_$LangStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
