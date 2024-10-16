import 'package:daisy/core/manager/remote/dio_client.dart';
import 'package:daisy/core/types/typedefs.dart';
import 'package:daisy/data/dto/auth/req_sign_in_dto.dart';
import 'package:daisy/data/dto/auth/req_sign_up_dto.dart';
import 'package:daisy/data/path/auth_path.dart';

abstract class IAuthRepo {
  AsyncResMap signIn(ReqSignInDto req);
  AsyncResMap signUp(ReqSignUpDto req);
}

class AuthRepo implements IAuthRepo {
  AuthRepo(this._dioClient);
  final DioClient _dioClient;

  @override
  AsyncResMap signIn(ReqSignInDto req) async =>
      await _dioClient.post(AuthPath.signIn.path, data: req.toJson());

  @override
  AsyncResMap signUp(ReqSignUpDto req) async =>
      await _dioClient.post(AuthPath.signUp.path, data: req.toJson());
}
