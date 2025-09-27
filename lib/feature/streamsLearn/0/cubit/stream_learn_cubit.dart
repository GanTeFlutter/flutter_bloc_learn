import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/streamsLearn/0/service/service_000.dart';
import 'package:meta/meta.dart';

part 'stream_learn_state.dart';

class StreamLearnCubit extends Cubit<StreamLearnState> {
  final Service000 _service;
  StreamLearnCubit(this._service) : super(StreamLearnInitial());

  void startCount(int count) async {
    emit(StreamLearnInitial());
    final stream = _service.countStream(count);
    emit(StreamLearnLoading(stream));

    int sum = await _service.sumStream(stream);
    emit(StreamLearnCompleted(sum));
  }

  void startCount1(int count) {
    final stream = _service
        .countStream(count)
        .asBroadcastStream(); // <- broadcast

    emit(StreamLearnLoading(stream));

    _service.sumStream1(stream).then((sum) {
      emit(StreamLearnCompleted(sum));
    });
  }
}
