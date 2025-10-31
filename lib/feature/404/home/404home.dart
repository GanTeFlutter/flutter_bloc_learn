import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/404/cubit/data_fetch_cubit.dart';
import 'package:flutter_bloc_example/feature/404/service/service.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => DataFetchCubit(FakeService())..getData(),
      create: (context) => DataFetchCubit(FakeService()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              context.read<DataFetchCubit>().getData();
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<DataFetchCubit, DataFetchState>(
          builder: (context, state) {
            return switch (state) {
              DataFetchInitial() => Text(
                state.defaultMessage,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              DataFetchLoading() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(value: state.progress),
                  Text(state.message),
                ],
              ),
              DataFetchLoaded() => Text(
                'Veri geldi: ${state.data}', // state.data kullanılıyor
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              DataFetchError() => Text(
                'Hata: ${state.message}',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            };
          },
        ),
      ),
    );
  }
}
