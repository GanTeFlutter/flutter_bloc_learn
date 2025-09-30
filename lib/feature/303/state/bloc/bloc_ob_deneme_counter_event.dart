part of 'bloc_ob_deneme_counter_bloc.dart';

sealed class BlocObDenemeCounterEvent extends Equatable {
  const BlocObDenemeCounterEvent();

  @override
  List<Object> get props => [];
}

final class BlocObDenemeCounterIncrementEvent extends BlocObDenemeCounterEvent {
  final int incrementValue;
  const BlocObDenemeCounterIncrementEvent(this.incrementValue);
  @override
  List<Object> get props => [incrementValue];
}


final class BlocObDenemeCounterDecrementEvent extends BlocObDenemeCounterEvent {
  final int decrementValue;
  const BlocObDenemeCounterDecrementEvent(this.decrementValue);
  @override
  List<Object> get props => [decrementValue];
}

final class BlocObDenemeCounterResetEvent extends BlocObDenemeCounterEvent {}