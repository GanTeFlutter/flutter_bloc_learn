import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/cubit/stream_learn_cubit.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/service/service_000.dart';

class BlocProviderConnecting extends StatelessWidget {
  final Widget child;
  final Service000 service;
  const BlocProviderConnecting({
    super.key,
    required this.child,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreamLearnCubit(service),
      child: child,
    );
  }
}

class StreamLearnd1 extends StatefulWidget {
  const StreamLearnd1({super.key});

  @override
  State<StreamLearnd1> createState() => _StreamLearnd1State();
}

class _StreamLearnd1State extends State<StreamLearnd1> {
  late final Service000 _service;
  @override
  void initState() {
    _service = Service000();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderConnecting(
      service: _service,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('StreamLearnd1'),
          actions: [
            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<StreamLearnCubit>().startCount(20);
                  },
                  child: const Text('Start'),
                );
              },
            ),
          ],
        ),

        body: BlocBuilder<StreamLearnCubit, StreamLearnState>(
          builder: (context, state) {
            if (state is StreamLearnInitial) {
              return Center(child: Text('0'));
            }
            if (state is StreamLearnLoading) {
              return Center(child: Text(state.progress.toString()));
            } else {
              return Center(child: Text('StateYok'));
            }
          },
        ),
      ),
    );
  }
}
