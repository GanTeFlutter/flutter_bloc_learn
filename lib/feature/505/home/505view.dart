import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/505/bloc/concurrency_bloc.dart';

class ConcurrenctProvider extends StatelessWidget {
  const ConcurrenctProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConcurrencyBloc(),
      child: const CconcurrencyView(),
    );
  }
}

class CconcurrencyView extends StatefulWidget {
  const CconcurrencyView({super.key});

  @override
  State<CconcurrencyView> createState() => _CconcurrencyViewState();
}

class _CconcurrencyViewState extends State<CconcurrencyView> {
  void concurrentTest() {
    context.read<ConcurrencyBloc>().add(FirstEvent(name: '1'));
    context.read<ConcurrencyBloc>().add(FirstEvent(name: '2'));
    context.read<ConcurrencyBloc>().add(FirstEvent(name: '3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CconcurrencyView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            BlocBuilder<ConcurrencyBloc, int>(
              builder: (context, state) {
                return Text('State: $state');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ConcurrencyBloc>().add(FirstEvent(name: 'tek'));
              },
              child: Text('tek'),
            ),
            ElevatedButton(onPressed: concurrentTest, child: Text('coklu')),

            ElevatedButton(
              onPressed: () {
                context.read<ConcurrencyBloc>().add(ClearEvent());
              },
              child: Text('clear'),
            ),
          ],
        ),
      ),
    );
  }
}
