import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daisy/core/config/core_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conn_cubit.freezed.dart';
part 'conn_state.dart';

class ConnCubit extends Cubit<ConnState> {
  ConnCubit({required this.connectivity}) : super(const ConnState());
  final Connectivity connectivity;

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<void> listen() async {
    _subscription = connectivity.onConnectivityChanged.listen(
      (result) async {
        result.contains(ConnectivityResult.wifi) ||
                result.contains(ConnectivityResult.mobile)
            ? emit(const ConnState(status: ConnStatus.online))
            : emit(const ConnState(status: ConnStatus.offline));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
