import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'no_context_connection_state.dart';

class NoContextConnectionCubit extends Cubit<NoContextConnectionState> {
  NoContextConnectionCubit({String initialText = 'Initial Text'})
    : super(NoContextConnectionInitial(text: initialText));

  void changeText(String newText) {
    emit(NoContextConnectionSuccess(newText));
  }
}
