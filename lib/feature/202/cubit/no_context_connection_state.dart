part of 'no_context_connection_cubit.dart';

@immutable
sealed class NoContextConnectionState extends Equatable {}

final class NoContextConnectionInitial extends NoContextConnectionState {
  final String text;

  NoContextConnectionInitial({this.text = 'initial'});

  @override
  List<Object?> get props => [text];
}

final class NoContextConnectionSuccess extends NoContextConnectionState {
  final String text;

  NoContextConnectionSuccess(this.text);

  @override
  List<Object?> get props => [text];
}
