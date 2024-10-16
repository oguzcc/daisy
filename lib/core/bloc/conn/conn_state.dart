part of 'conn_cubit.dart';

enum ConnStatus {
  online(CoreStrings.online),
  offline(CoreStrings.offline),
  ;

  const ConnStatus(this.message);
  final String message;
}

@freezed
class ConnState with _$ConnState {
  const factory ConnState({
    @Default(ConnStatus.offline) ConnStatus status,
  }) = _ConnState;
}
