import 'package:flutter/foundation.dart';
import 'package:passport_mobile/models/local_auth.dart';
import 'package:passport_mobile/models/login_models.dart';
import 'package:passport_mobile/util/network_manager.dart';
import 'package:passport_mobile/util/storage.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    LocalAuth localAuth = getLocalInformation();
    if (localAuth.authToken == "") {
      return;
    }
    tryValidate(localAuth.authToken).then(
      (response) => {
        if (response == null)
          {removeLocalAuth()}
        else
          {_isLoggedIn = true, notifyListeners()},
      },
    );

    // TODO: Validate Token
    // If token valid -> change login to true
  }
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    LoginResponse? res = await requestLogin(email, password);
    if (res == null) {
      _isLoggedIn = false;
      notifyListeners();
      return false;
    }
    saveLocalAuth(res.name, res.surname, res.email, res.authToken);
    savePemString(res.pemString);
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }
}
