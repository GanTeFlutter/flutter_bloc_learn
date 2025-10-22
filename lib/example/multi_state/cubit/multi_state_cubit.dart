import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'multi_state_state.dart';

class MultiStateCubit extends Cubit<MultiStateState> {
  MultiStateCubit() : super(MultiStateInitial()) {
    loadData();
  }

  void loadData() {
    emit(MultiStateLoaded(item, item1, data_1, data_2));
  }

  //Bu şekilde itemı günzeleyebiliriz ancak diğerlerine de dokunmuş oluruz
  //onlara da bir değer emit etmemiz gerkiyor aksi takirde
  // void items(List<String> item) {
  //   if (state is MultiStateLoaded) {
  //     final currentState = state as MultiStateLoaded;
  //     emit(
  //       MultiStateLoaded(
  //         item,
  //         currentState.items1,
  //         currentState.data1,
  //         currentState.data2,
  //       ),
  //     );
  //   }
  // }

  //bu daha temiz bir yöntem
  void items(List<String> newItems) {
    if (state is MultiStateLoaded) {
      final currentState = state as MultiStateLoaded;
      emit(currentState.copyWith(items: newItems));
    }
  }
}

final item = ['Item 1', 'Item 2', 'Item 3'];
final item1 = [1, 2, 3];
final data_1 = 'Sample Data';
final data_2 = 42;
