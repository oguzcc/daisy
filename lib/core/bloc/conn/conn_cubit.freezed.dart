// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conn_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnState {
  ConnStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of ConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnStateCopyWith<ConnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnStateCopyWith<$Res> {
  factory $ConnStateCopyWith(ConnState value, $Res Function(ConnState) then) =
      _$ConnStateCopyWithImpl<$Res, ConnState>;
  @useResult
  $Res call({ConnStatus status});
}

/// @nodoc
class _$ConnStateCopyWithImpl<$Res, $Val extends ConnState>
    implements $ConnStateCopyWith<$Res> {
  _$ConnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnStateImplCopyWith<$Res>
    implements $ConnStateCopyWith<$Res> {
  factory _$$ConnStateImplCopyWith(
          _$ConnStateImpl value, $Res Function(_$ConnStateImpl) then) =
      __$$ConnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConnStatus status});
}

/// @nodoc
class __$$ConnStateImplCopyWithImpl<$Res>
    extends _$ConnStateCopyWithImpl<$Res, _$ConnStateImpl>
    implements _$$ConnStateImplCopyWith<$Res> {
  __$$ConnStateImplCopyWithImpl(
      _$ConnStateImpl _value, $Res Function(_$ConnStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ConnStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnStatus,
    ));
  }
}

/// @nodoc

class _$ConnStateImpl implements _ConnState {
  const _$ConnStateImpl({this.status = ConnStatus.offline});

  @override
  @JsonKey()
  final ConnStatus status;

  @override
  String toString() {
    return 'ConnState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of ConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnStateImplCopyWith<_$ConnStateImpl> get copyWith =>
      __$$ConnStateImplCopyWithImpl<_$ConnStateImpl>(this, _$identity);
}

abstract class _ConnState implements ConnState {
  const factory _ConnState({final ConnStatus status}) = _$ConnStateImpl;

  @override
  ConnStatus get status;

  /// Create a copy of ConnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnStateImplCopyWith<_$ConnStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
