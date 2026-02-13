import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  String authToken = "";
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }
}
