import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_ob_deneme_counter_event.dart';
part 'bloc_ob_deneme_counter_state.dart';

///[BlocObDenemeCounterBloc] ı [StateInitialize] (main kısmında) içinde başlatıyoruz.

class BlocObDenemeCounterBloc
    extends Bloc<BlocObDenemeCounterEvent, BlocObDenemeCounterState> {
  BlocObDenemeCounterBloc() : super(BlocObDenemeCounterInitial()) {
    on<BlocObDenemeCounterEvent>((event, emit) {});
    on<BlocObDenemeCounterIncrementEvent>(_onIncrementEvent);
    on<BlocObDenemeCounterDecrementEvent>(_onDecrementEvent);
    on<BlocObDenemeCounterResetEvent>((event, emit) {
      emit(BlocObDenemeCounterValueState(0));
    });
  }

  int counterValue = 0;

  void _onIncrementEvent(
    BlocObDenemeCounterIncrementEvent event,
    Emitter<BlocObDenemeCounterState> emit,
  ) {
    if (state is BlocObDenemeCounterValueState) {
      final currentValue =
          (state as BlocObDenemeCounterValueState).counterValue;
      final counterValue = currentValue + event.incrementValue;
      emit(BlocObDenemeCounterValueState(counterValue));
    } else {
      emit(BlocObDenemeCounterValueState(event.incrementValue));
    }
  }

  void _onDecrementEvent(
    BlocObDenemeCounterDecrementEvent event,
    Emitter<BlocObDenemeCounterState> emit,
  ) {
    if (state is BlocObDenemeCounterValueState) {
      final currentValue =
          (state as BlocObDenemeCounterValueState).counterValue;
      final counterValue =
          currentValue + event.decrementValue; // -1 gönderince azalır
      emit(BlocObDenemeCounterValueState(counterValue));
    } else {
      emit(BlocObDenemeCounterValueState(event.decrementValue));
    }
  }
}
