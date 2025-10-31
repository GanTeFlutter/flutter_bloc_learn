import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/product/service/service_locator.dart';

///[BlocObserver] ı [AppInitialize].make (main kısmında) içinde başlatıyoruz.

/// BLoC gözlemcisi [BlocObserver] ın üzerine ctrl+mouse ile tıklayın ve detayları inceleyin.Altta ne yaptığımıza dair detaylı açıklama var.

class MyBlocObserver extends BlocObserver {
  const MyBlocObserver();
  // BLoC oluşturulduğunda
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    locator.logger.i('✅ BLoC Created: ${bloc.runtimeType}');
  }

  // Event eklendiğinde
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    locator.logger.i('📥 onEvent -- ${bloc.runtimeType}, event: $event');
  }

  // State değiştiğinde
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    locator.logger.i('🔄 onChange -- ${bloc.runtimeType}, change: $change');
  }

  // Transition (event -> state geçişi) olduğunda
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    locator.logger.i(
      '🔀 onTransition -- ${bloc.runtimeType}, transition: $transition',
    );
  }

  // Hata oluştuğunda
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    locator.logger.e('❌ onError -- ${bloc.runtimeType}, error: $error');
  }

  // BLoC kapatıldığında
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    locator.logger.i('🔒 onClose -- ${bloc.runtimeType}');
  }
}
