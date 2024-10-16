import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_sign_up_dto.freezed.dart';
part 'req_sign_up_dto.g.dart';

@freezed
class ReqSignUpDto with _$ReqSignUpDto {
  const factory ReqSignUpDto({
    required String name,
    required String email,
    required String password,
  }) = _ReqSignUpDto;

  factory ReqSignUpDto.fromJson(Map<String, dynamic> json) =>
      _$ReqSignUpDtoFromJson(json);
}
