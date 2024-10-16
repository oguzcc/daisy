import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:daisy/core/bloc/conn/conn_cubit.dart';
import 'package:daisy/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider<StateStreamableSource<Object?>>> provider() {
  return <BlocProvider>[
    BlocProvider<ConnCubit>(
      create: (context) => ConnCubit(connectivity: Connectivity())..listen(),
    ),

    /// Auth Cubit
    BlocProvider<AuthCubit>(create: (context) => AuthCubit(context.read())),

    /// User Cubit
  ];
}
