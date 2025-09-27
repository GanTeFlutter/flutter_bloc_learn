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
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<StreamLearnCubit>().startCount(20);
                      },
                      child: const Text('Start'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<StreamLearnCubit>().startCount1(30);
                      },
                      child: const Text('Start1'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<StreamLearnCubit, StreamLearnState>(
              builder: (context, state) {
                if (state is StreamLearnInitial) {
                  return const Center(child: Text('0'));
                }

                if (state is StreamLearnLoading) {
                  return StreamBuilder<int>(
                    stream: state.progress,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text('0');
                      return Center(
                        child: Text(
                          snapshot.data.toString(),
                          style: const TextStyle(fontSize: 32),
                        ),
                      );
                    },
                  );
                }

                if (state is StreamLearnCompleted) {
                  return Center(
                    child: Text(
                      'Sum: ${state.result}',
                      style: const TextStyle(fontSize: 32),
                    ),
                  );
                }

                return const Center(child: Text('stateyok'));
              },
            ),
            const SizedBox(height: 20),
            // Buraya toplam sonucu en altta ekleyelim
            BlocBuilder<StreamLearnCubit, StreamLearnState>(
              builder: (context, state) {
                if (state is StreamLearnCompleted) {
                  return Text(
                    'Toplam: ${state.result}',
                    style: const TextStyle(fontSize: 24, color: Colors.green),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
