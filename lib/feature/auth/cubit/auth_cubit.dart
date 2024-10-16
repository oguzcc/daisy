import 'package:daisy/core/enum/common_enum.dart';
import 'package:daisy/data/dto/auth/req_sign_in_dto.dart';
import 'package:daisy/data/dto/auth/req_sign_up_dto.dart';
import 'package:daisy/data/model/auth_model.dart';
import 'package:daisy/data/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

/// Auth Cubit class that manages operations related to authentication.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(const AuthState());
  final IAuthService _authService;

  Future<void> authenticate() async {}

  Future<void> signIn(ReqSignInDto req) async {
    emit(state.copyWith(status: Status.loading));
    final res = await _authService.signIn(req);
    res.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) => emit(state.copyWith(status: Status.success, authModel: r)),
    );
  }

  Future<void> signUp(ReqSignUpDto req) async {
    emit(state.copyWith(status: Status.loading));
    final res = await _authService.signUp(req);
    res.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) => emit(state.copyWith(status: Status.success, authModel: r)),
    );
  }
}
