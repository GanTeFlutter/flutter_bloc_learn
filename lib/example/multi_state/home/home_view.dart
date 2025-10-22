import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/example/multi_state/cubit/multi_state_cubit.dart';
import 'package:flutter_bloc_example/product/service/service_locator.dart';

class HomeViewMulti extends StatefulWidget {
  const HomeViewMulti({super.key});

  @override
  State<HomeViewMulti> createState() => _HomeViewMultiState();
}

class _HomeViewMultiState extends State<HomeViewMulti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeViewMulti')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.read<MultiStateCubit>().items([
                      'Ne m 1',
                      'Netem 2',
                      'Newtem 3',
                    ]);
                  },
                  child: Text(
                    'items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            BlocSelector<MultiStateCubit, MultiStateState, List<String>>(
              selector: (state) {
                if (state is MultiStateLoaded) {
                  return state.items;
                }
                return [];
              },
              builder: (BuildContext context, state) {
                locator.logger.d('Rebuild Items List<String>');
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: ListTile(
                        textColor: Colors.blue,
                        title: Text(state[index], textAlign: TextAlign.center),
                      ),
                    );
                  },
                );
              },
            ),

            BlocSelector<MultiStateCubit, MultiStateState, List<int>>(
              selector: (state) {
                if (state is MultiStateLoaded) {
                  return state.items1;
                }
                return [];
              },
              builder: (BuildContext context, state) {
                locator.logger.d('Rebuild Items List<int>');
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: ListTile(
                        textColor: Colors.blue,
                        title: Text(
                          state[index].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            BlocSelector<MultiStateCubit, MultiStateState, String>(
              selector: (state) {
                if (state is MultiStateLoaded) {
                  return state.data1;
                }
                return '';
              },
              builder: (BuildContext context, state) {
                locator.logger.d('Rebuild Items String');
                return Text(
                  state,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),

            BlocSelector<MultiStateCubit, MultiStateState, int>(
              selector: (state) {
                if (state is MultiStateLoaded) {
                  return state.data2;
                }
                return 0;
              },
              builder: (BuildContext context, state) {
                locator.logger.d('Rebuild Items int');
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
