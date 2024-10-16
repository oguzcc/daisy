import 'package:daisy/core/bloc/conn/conn_cubit.dart';
import 'package:daisy/feature/auth/cubit/auth_cubit.dart';
import 'package:daisy/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocListener<StateStreamable<dynamic>, dynamic>> listener() {
  return <BlocListener<StateStreamable<dynamic>, dynamic>>[
    BlocListener<ConnCubit, ConnState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {},
    ),
    BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        goRouter.refresh();
      },
    ),
  ];
}
