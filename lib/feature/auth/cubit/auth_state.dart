part of 'auth_cubit.dart';

enum AuthStatus { initial, authenticating, authenticated, unauthenticated }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    @Default(Status.initial) Status status,
    @Default(AuthModel()) AuthModel authModel,
  }) = _AuthState;
}
