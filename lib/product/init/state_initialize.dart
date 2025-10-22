import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/example/multi_state/cubit/multi_state_cubit.dart';
import 'package:flutter_bloc_example/feature/303/state/bloc/bloc_ob_deneme_counter_bloc.dart';

import 'package:flutter_bloc_example/product/state/cubit/deneme_cubit.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DenemeCubit()),
        BlocProvider(create: (context) => BlocObDenemeCounterBloc()),
        BlocProvider(create: (context) => MultiStateCubit()),
      ],
      child: child,
    );
  }
}
