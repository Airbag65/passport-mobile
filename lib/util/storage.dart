import 'package:localstorage/localstorage.dart';
import 'package:passport_mobile/models/local_auth.dart';

LocalAuth getLocalInformation() {
  String name = localStorage.getItem("name") ?? "";
  String surname = localStorage.getItem("surname") ?? "";
  String email = localStorage.getItem("email") ?? "";
  String authToken = localStorage.getItem("auth_token") ?? "";
  return LocalAuth(
    name: name,
    surname: surname,
    email: email,
    authToken: authToken,
  );
}

void saveLocalAuth(
  String name,
  String surname,
  String email,
  String authToken,
) {
  localStorage.setItem("name", name);
  localStorage.setItem("surname", surname);
  localStorage.setItem("email", email);
  localStorage.setItem("auth_token", authToken);
}

void saveLocalAuthObj(LocalAuth auth) {
  localStorage.setItem("name", auth.name);
  localStorage.setItem("surname", auth.surname);
  localStorage.setItem("email", auth.email);
  localStorage.setItem("auth_token", auth.authToken);
}

void removeLocalAuth() {
  localStorage.setItem("name", "");
  localStorage.setItem("surname", "");
  localStorage.setItem("email", "");
  localStorage.setItem("auth_token", "");
}

void savePemString(String pem) {
  localStorage.setItem("pem_string", pem);
}

String getPemString() {
  return localStorage.getItem("pem_string") ?? "";
}
