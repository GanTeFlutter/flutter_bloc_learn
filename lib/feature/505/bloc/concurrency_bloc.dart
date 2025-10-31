import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart'; // <-- Bunu ekle

sealed class ConcurrencyEvent extends Equatable {
  const ConcurrencyEvent();

  @override
  List<Object> get props => [];
}

final class FirstEvent extends ConcurrencyEvent {
  final String? name;

  FirstEvent({this.name});
}

final class ClearEvent extends ConcurrencyEvent {
  ClearEvent();
}

class ConcurrencyBloc extends Bloc<ConcurrencyEvent, int> {
  ConcurrencyBloc() : super(0) {
    on<FirstEvent>((event, emit) async {
      debugPrint('--Event alındı: ${event.name}');
      await Future.delayed(const Duration(seconds: 2));
      emit(state + 1);
      debugPrint('--Event işlendi: ${event.name}, yeni state: $state');
    }, transformer: sequential());

    on<ClearEvent>(
      (event, emit) {
        emit(0);
        debugPrint('--Event işlendi: ClearEvent, yeni state: 0');
      },
      //  transformer: sequential(),
    );
  }
}


/*

⚙️ sequential()

Event’leri sırayla işler.
Önceki event bitmeden diğeri başlamaz.
Yavaş ama güvenlidir, sıra garantisi vardır.

🧩 Örnek: Kuyruktaki işleri teker teker yapmak gibi.

sıra ile alıyor birini bitiriyor digerine gectiriyor


I/flutter (27967): --Event alındı: 1
I/flutter (27967): --Event işlendi: 1, yeni state: 1
I/flutter (27967): --Event alındı: 2
I/flutter (27967): --Event işlendi: 2, yeni state: 2
I/flutter (27967): --Event alındı: 3
I/flutter (27967): --Event işlendi: 3, yeni state: 3

coklu gonderince sırayla işliyor

⚡ concurrent()

Event’leri aynı anda (paralel) çalıştırır.
Her event kendi başına hemen işlenir.
Hızlıdır ama sıra garantisi yoktur.

🧩 Örnek: Üç farklı işi aynı anda başlatmak gibi.
I/flutter (27967): --Event alındı: 1
I/flutter (27967): --Event alındı: 2
I/flutter (27967): --Event alındı: 3
I/flutter (27967): --Event işlendi: 1, yeni state: 4
I/flutter (27967): --Event işlendi: 2, yeni state: 5
I/flutter (27967): --Event işlendi: 3, yeni state: 6

üçünü alıyor üçünü aynı anda basıyor 


🚫 droppable()

Bir event çalışırken yenilerini yok sayar.
Mevcut event bitene kadar gelen event’ler düşürülür.
Gereksiz tekrarları önler.

🧩 Örnek: Zaten yükleme devam ederken tekrar “yükle” demeyi yok saymak gibi.
I/flutter (27967): --Event alındı: 1
I/flutter (27967): --Event işlendi: 1, yeni state: 1

3 add ayni anda gondermeme rağmen sadece ilk event işleniyor. bitene kadar da digerleri yok sayiliyor.


🔁 restartable()

Yeni event gelirse, öncekini iptal edip yenisini başlatır.
En güncel event her zaman çalışır.
Özellikle arama kutuları gibi durumlar için idealdir.

🧩 Örnek: Kullanıcı yeni arama yazarsa, önceki sorguyu iptal edip yenisini başlatmak gibi.


E/gralloc4(25547): Empty SMPTE 2094-40 data
Restarted application in 2.067ms.
I/flutter (27967): --Event alındı: 1
I/flutter (27967): --Event alındı: 2
I/flutter (27967): --Event alındı: 3
I/flutter (27967): --Event işlendi: 1, yeni state: 0
I/flutter (27967): --Event işlendi: 2, yeni state: 0
I/flutter (27967): --Event işlendi: 3, yeni state: 1

 */