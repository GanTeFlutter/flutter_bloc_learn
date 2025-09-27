part of 'stream_learn_cubit.dart';

@immutable
sealed class StreamLearnState {}

final class StreamLearnInitial extends StreamLearnState {}

final class StreamLearnLoading extends StreamLearnState {
  final Stream<int> progress;
  StreamLearnLoading(this.progress);
}

final class StreamLearnCompleted extends StreamLearnState {
  final int result;
  StreamLearnCompleted(this.result);
}
