class Service000 {
  Stream<int> countStream(int max) async* {
    for (int i = 0; i < max; i++) {
      yield i;
    }
  }

  Future<int> sumStream(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }

  //---
  Stream<int> countStream1(int max) async* {
    for (int i = 0; i < max; i++) {
      yield i;
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  Future<int> sumStream1(Stream<int> stream) async {
    int sum = 0;
    await for (int value in stream) {
      sum += value;
    }
    return sum;
  }
}
