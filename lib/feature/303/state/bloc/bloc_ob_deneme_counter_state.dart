part of 'bloc_ob_deneme_counter_bloc.dart';

sealed class BlocObDenemeCounterState extends Equatable {
  const BlocObDenemeCounterState();

  @override
  List<Object> get props => [];
}

final class BlocObDenemeCounterInitial extends BlocObDenemeCounterState {}

final class BlocObDenemeCounterValueState extends BlocObDenemeCounterState {
  final int counterValue;
  const BlocObDenemeCounterValueState(this.counterValue);

  @override
  List<Object> get props => [counterValue];
}
