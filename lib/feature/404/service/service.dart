class FakeService {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 10));
    return "Fetched Data";
  }
}
