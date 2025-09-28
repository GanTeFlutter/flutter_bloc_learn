import 'dart:async';

class CounterStreamService {
  late Stream<int> counterStream;

  CounterStreamService({int count = 15}) {
    // Stream.periodic ile zamanla veri üreten stream
    counterStream = Stream<int>.periodic(
      const Duration(seconds: 1),
      (x) => x,
    ).take(count);
  }

  void startListening() async {
    //Her veri geldiğinde döngü bir tur çalışır.Veri gelmezse döngü bekler.
    await for (var value in counterStream) {
      print("Gelen değer: $value");
    }
    print("Stream tamamlandı!");
  }
}
