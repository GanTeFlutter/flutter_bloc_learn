part of 'multi_state_cubit.dart';

sealed class MultiStateState extends Equatable {
  const MultiStateState();

  @override
  List<Object> get props => [];
}

final class MultiStateInitial extends MultiStateState {}

final class MultiStateLoaded extends MultiStateState {
  final List<String> items;
  final List<int> items1;

  final String data1;
  final int data2;

  const MultiStateLoaded(this.items, this.items1, this.data1, this.data2);

  
  MultiStateLoaded copyWith({
    List<String>? items,
    List<int>? items1,
    String? data1,
    int? data2,
  }) {
    return MultiStateLoaded(
      items ?? this.items,
      items1 ?? this.items1,
      data1 ?? this.data1,
      data2 ?? this.data2,
    );
  }

  @override
  List<Object> get props => [items, items1, data1, data2];
}
