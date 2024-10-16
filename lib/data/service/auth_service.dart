import 'package:daisy/core/types/data_exception.dart';
import 'package:daisy/core/types/typedefs.dart';
import 'package:daisy/data/dto/auth/req_sign_in_dto.dart';
import 'package:daisy/data/dto/auth/req_sign_up_dto.dart';
import 'package:daisy/data/model/auth_model.dart';
import 'package:daisy/data/repo/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthService {
  AsyncRes<AuthModel> signIn(ReqSignInDto req);
  AsyncRes<AuthModel> signUp(ReqSignUpDto req);
}

class AuthService implements IAuthService {
  AuthService(this._authRepo);
  final IAuthRepo _authRepo;

  @override
  AsyncRes<AuthModel> signIn(ReqSignInDto req) async {
    try {
      final json = await _authRepo.signIn(req);
      return right(AuthModel.fromJson(json.data!));
    } catch (e) {
      return left(Err(e));
    }
  }

  @override
  AsyncRes<AuthModel> signUp(ReqSignUpDto req) async {
    try {
      final json = await _authRepo.signUp(req);
      return right(AuthModel.fromJson(json.data!));
    } catch (e) {
      return left(Err(e));
    }
  }
}
