class LoginRequest {
  LoginRequest({required String email, required String password})
    : _email = email,
      _password = password;

  final String _email;
  final String _password;

  Map<String, dynamic> toJson() => {"email": _email, "password": _password};
}

class LoginResponse {
  LoginResponse({
    required int responseCode,
    required String responseMessage,
    required String authToken,
    required String name,
    required String surname,
    required String email,
    required String pemString,
  }) : _responseCode = responseCode,
       _responseMessage = responseMessage,
       _authToken = authToken,
       _name = name,
       _surname = surname,
       _email = email,
       _pemString = pemString;

  final int _responseCode;
  final String _responseMessage;
  final String _authToken;
  final String _name;
  final String _surname;
  final String _email;
  final String _pemString;

  int get responseCode => _responseCode;
  String get responseMessage => _responseMessage;
  String get authToken => _authToken;
  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  String get pemString => _pemString;

  LoginResponse.fromJson(Map<String, dynamic> json)
    : _responseCode = json["response_code"],
      _responseMessage = json["response_message"],
      _authToken = json["auth_token"],
      _name = json["name"],
      _surname = json["surname"],
      _email = json["email"],
      _pemString = json["pem_string"];
}
