import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/303/state/bloc/bloc_ob_deneme_counter_bloc.dart';

part '../home/bloc_ob_text_widget.dart';

class BlocObDenemeView extends StatefulWidget {
  const BlocObDenemeView({super.key});

  @override
  State<BlocObDenemeView> createState() => _BlocObDenemeViewState();
}

class _BlocObDenemeViewState extends State<BlocObDenemeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BlocObDenemeView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            _BlocObText(),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconbutton(context, () {
                  context.read<BlocObDenemeCounterBloc>().add(
                    BlocObDenemeCounterIncrementEvent(1),
                  );
                }, Icons.add),

                iconbutton(context, () {
                  context.read<BlocObDenemeCounterBloc>().add(
                    BlocObDenemeCounterResetEvent(),
                  );
                }, Icons.clear),
                iconbutton(context, () {
                  context.read<BlocObDenemeCounterBloc>().add(
                    BlocObDenemeCounterDecrementEvent(-1),
                  );
                }, Icons.remove),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton iconbutton(
    BuildContext context,
    VoidCallback? onPressed,
    IconData? icon,
  ) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }
}

