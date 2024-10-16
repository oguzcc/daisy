import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_sign_in_dto.freezed.dart';
part 'req_sign_in_dto.g.dart';

@freezed
class ReqSignInDto with _$ReqSignInDto {
  const factory ReqSignInDto({
    required String email,
    required String password,
  }) = _ReqSignInDto;

  factory ReqSignInDto.fromJson(Map<String, dynamic> json) =>
      _$ReqSignInDtoFromJson(json);
}
