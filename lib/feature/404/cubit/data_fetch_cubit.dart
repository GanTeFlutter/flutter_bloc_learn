import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/404/service/service.dart';



class DataFetchCubit extends Cubit<DataFetchState> {
  DataFetchCubit(this._service) : super(DataFetchInitial());

  final FakeService _service;

  Future<void> getData() async {
    try {
      // 1. Future başlatılıyor ama BEKLENMIYOR (await yok)
      final fetchFuture = _service.fetchData(); // 5 saniye sürecek

      // 2. Bu arada UI güncellemeleri yapılıyor (paralel)
      emit(const DataFetchLoading());
      await Future.delayed(const Duration(seconds: 1)); // 1 sn

      emit(const DataFetchLoading(progress: 0.5, message: "Yarıladık..."));
      await Future.delayed(const Duration(seconds: 1)); // 1 sn

      emit(const DataFetchLoading(progress: 0.9, message: "Bitmek üzere..."));

      // 3. Şimdi veriyi bekliyoruz
      final response = await fetchFuture; // Kalan süre: 5 - 2 = 3 saniye

      emit(DataFetchLoaded(data: response));
    } catch (e) {
      emit(DataFetchError(message: e.toString()));
    }

    //
  }
}

//--------------------------

sealed class DataFetchState extends Equatable {
  const DataFetchState();

  @override
  List<Object> get props => [];
}

final class DataFetchInitial extends DataFetchState {
  final String defaultMessage =
      'Henüz veri gelmedi. İndirmek için butona basın.';
}

final class DataFetchLoading extends DataFetchState {
  final double progress;
  final String message;

  const DataFetchLoading({this.progress = 0.0, this.message = "Yükleniyor..."});

  @override
  List<Object> get props => [progress, message];
}

final class DataFetchLoaded extends DataFetchState {
  final String data;
  const DataFetchLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class DataFetchError extends DataFetchState {
  final String message;
  const DataFetchError({required this.message});
  @override
  List<Object> get props => [message];
}
