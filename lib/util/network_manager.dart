import 'dart:convert';
import 'dart:io';

import 'package:passport_mobile/models/get_password_models.dart';
import 'package:passport_mobile/models/login_models.dart';
import 'package:http/http.dart' as http;
import 'package:passport_mobile/models/signout_models.dart';
import 'package:passport_mobile/models/validate_models.dart';
import 'package:passport_mobile/util/storage.dart';

class AllowUnsecure extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<LoginResponse?> requestLogin(String email, String password) async {
  LoginRequest req = LoginRequest(email: email, password: password);
  http.Response response = await http.post(
    Uri.parse("https://192.168.1.151:443/auth/login"),
    headers: <String, String>{"Content-Type": "application/json"},
    body: jsonEncode(req.toJson()),
  );
  if (response.statusCode != 200) {
    return null;
  }
  return LoginResponse.fromJson(jsonDecode(response.body));
}

Future<ValidateResponse?> tryValidate(String authToken) async {
  ValidateRequest req = ValidateRequest(authToken: authToken);
  http.Response response = await http.post(
    Uri.parse("https://192.168.1.151:443/auth/valid"),
    headers: <String, String>{"Content-Type": "application/json"},
    body: jsonEncode(req.toJson()),
  );
  if (response.statusCode != 200) {
    return null;
  }
  return ValidateResponse.fromJson(jsonDecode(response.body));
}

Future<SignOutResponse?> requestSignOut() async {
  SignOutRequest req = SignOutRequest(email: getLocalInformation().email);
  http.Response response = await http.put(
    Uri.parse("https://192.168.1.151:443/auth/signOut"),
    headers: <String, String>{"Content-Type": "application/json"},
    body: jsonEncode(req.toJson()),
  );

  if (response.statusCode != 200) {
    return null;
  }

  return SignOutResponse.fromJson(jsonDecode(response.body));
}

Future<List<String>> getPasswordHosts() async {
  http.Response response = await http.get(
    Uri.parse("https://192.168.1.151:443/pwd/getHosts"),
    headers: <String, String>{
      "Authorization": "Bearer ${getLocalInformation().authToken}",
    },
  );
  if (response.statusCode != 200) {
    return [];
  }
  Map<String, dynamic> data = jsonDecode(response.body);
  List<String> l = [];
  data["hosts"]?.forEach((element) => l.add(element));
  return l;
}

Future<GetPasswordResponse?> requestPasswordWithHost(String host) async {
  GetPasswordRequest req = GetPasswordRequest(hostName: host);
  http.Response response = await http.put(
    Uri.parse("https://192.168.1.151:443/pwd/get"),
    headers: <String, String>{
      "Authorization": "Bearer ${getLocalInformation().authToken}",
    },
    body: jsonEncode(req.toJson()),
  );

  if (response.statusCode != 200) {
    return null;
  }
  return GetPasswordResponse.fromJson(jsonDecode(response.body));
}

Future<bool> requestPasswordRemoval(String host) async {
  RemovePasswordRequest req = RemovePasswordRequest(hostName: host);
  http.Response response = await http.delete(
    Uri.parse("https://192.168.1.151:443/pwd/remove"),
    headers: <String, String>{
      "Authorization": "Bearer ${getLocalInformation().authToken}",
    },
    body: jsonEncode(req.toJson()),
  );
  if (response.statusCode != 200) {
    return false;
  }
  return true;
}

Future<bool> uploadNewPassword(String hostname, String password) async {
  AddPasswordRequest req = AddPasswordRequest(
    hostName: hostname,
    password: password,
  );
  http.Response response = await http.post(
    Uri.parse("https://192.168.1.151:443/pwd/new"),
    headers: <String, String>{
      "Authorization": "Bearer ${getLocalInformation().authToken}",
      "Content-Type": "application/json",
    },
    body: jsonEncode(req.toJson()),
  );
  if (response.statusCode != 200) {
    return false;
  }
  return true;
}
