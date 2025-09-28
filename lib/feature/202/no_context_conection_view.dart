import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/202/cubit/no_context_connection_cubit.dart';

class NoContextConectionView extends StatefulWidget {
  const NoContextConectionView({super.key});

  @override
  State<NoContextConectionView> createState() => _NoContextConectionViewState();
}

class _NoContextConectionViewState extends State<NoContextConectionView> {
  late final NoContextConnectionCubit noContextConnectionCubit;

  @override
  void initState() {
    super.initState();
    noContextConnectionCubit = NoContextConnectionCubit();
  }

  //elle olusturdugumuz icin kapatmamiz lazim
  @override
  void dispose() {
    noContextConnectionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NoContextConectionView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            BlocBuilder<NoContextConnectionCubit, NoContextConnectionState>(
              bloc: noContextConnectionCubit,
              builder: (context, state) {
                if (state is NoContextConnectionInitial) {
                  return Text(state.text);
                }
                if (state is NoContextConnectionSuccess) {
                  return Text(state.text);
                } else {
                  return Text('state.toString()');
                }
              },
            ),
            ElevatedButton(
              onPressed: () => noContextConnectionCubit.changeText('New Text'),
              child: const Text('Change Text 1'),
            ),
            ElevatedButton(
              onPressed: () =>
                  noContextConnectionCubit.changeText('Another Text'),
              child: const Text('Change Text 2'),
            ),
          ],
        ),
      ),
    );
  }
}
