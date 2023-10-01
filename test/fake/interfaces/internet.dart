import 'package:search_repo/application/interfaces/internet.dart';

class FakeInternetImpl implements Internet {
  @override
  Future<bool> check() async {
    return false;
  }
}
