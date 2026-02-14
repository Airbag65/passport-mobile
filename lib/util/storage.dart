import 'package:localstorage/localstorage.dart';
import 'package:passport_mobile/models/local_auth.dart';

LocalAuth getLocalInformation() {
  String name = localStorage.getItem("name")!;
  String surname = localStorage.getItem("surname")!;
  String email = localStorage.getItem("email")!;
  String authToken = localStorage.getItem("auth_token")!;
  return LocalAuth(
    name: name,
    surname: surname,
    email: email,
    authToken: authToken,
  );
}
