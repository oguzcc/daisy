// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqSignUpDtoImpl _$$ReqSignUpDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReqSignUpDtoImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$ReqSignUpDtoImplToJson(_$ReqSignUpDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
