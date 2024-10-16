// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'req_sign_in_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReqSignInDto _$ReqSignInDtoFromJson(Map<String, dynamic> json) {
  return _ReqSignInDto.fromJson(json);
}

/// @nodoc
mixin _$ReqSignInDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this ReqSignInDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReqSignInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqSignInDtoCopyWith<ReqSignInDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqSignInDtoCopyWith<$Res> {
  factory $ReqSignInDtoCopyWith(
          ReqSignInDto value, $Res Function(ReqSignInDto) then) =
      _$ReqSignInDtoCopyWithImpl<$Res, ReqSignInDto>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$ReqSignInDtoCopyWithImpl<$Res, $Val extends ReqSignInDto>
    implements $ReqSignInDtoCopyWith<$Res> {
  _$ReqSignInDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReqSignInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqSignInDtoImplCopyWith<$Res>
    implements $ReqSignInDtoCopyWith<$Res> {
  factory _$$ReqSignInDtoImplCopyWith(
          _$ReqSignInDtoImpl value, $Res Function(_$ReqSignInDtoImpl) then) =
      __$$ReqSignInDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$ReqSignInDtoImplCopyWithImpl<$Res>
    extends _$ReqSignInDtoCopyWithImpl<$Res, _$ReqSignInDtoImpl>
    implements _$$ReqSignInDtoImplCopyWith<$Res> {
  __$$ReqSignInDtoImplCopyWithImpl(
      _$ReqSignInDtoImpl _value, $Res Function(_$ReqSignInDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReqSignInDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$ReqSignInDtoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqSignInDtoImpl implements _ReqSignInDto {
  const _$ReqSignInDtoImpl({required this.email, required this.password});

  factory _$ReqSignInDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqSignInDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'ReqSignInDto(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqSignInDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of ReqSignInDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqSignInDtoImplCopyWith<_$ReqSignInDtoImpl> get copyWith =>
      __$$ReqSignInDtoImplCopyWithImpl<_$ReqSignInDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqSignInDtoImplToJson(
      this,
    );
  }
}

abstract class _ReqSignInDto implements ReqSignInDto {
  const factory _ReqSignInDto(
      {required final String email,
      required final String password}) = _$ReqSignInDtoImpl;

  factory _ReqSignInDto.fromJson(Map<String, dynamic> json) =
      _$ReqSignInDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of ReqSignInDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqSignInDtoImplCopyWith<_$ReqSignInDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
