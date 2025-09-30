part of '../home/bloc_ob_deneme_view.dart';

final class _BlocObText extends StatelessWidget {
  const _BlocObText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocObDenemeCounterBloc, BlocObDenemeCounterState>(
      builder: (context, state) {
        if (state is BlocObDenemeCounterInitial) {
          return _textWidget(context, '0');
        } else if (state is BlocObDenemeCounterValueState) {
          return _textWidget(context, state.counterValue.toString());
        } else {
          return _textWidget(context, 'Unknown State');
        }
      },
    );
  }
}

Text _textWidget(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.displayLarge?.copyWith(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  );
}

// TextStyle? _textStyle(BuildContext context) => Theme.of(context)
//     .textTheme
//     .displayLarge
//     ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold);
