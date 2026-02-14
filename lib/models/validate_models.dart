class ValidateRequest {
  ValidateRequest({required String authToken}) : _authToken = authToken;

  final String _authToken;

  Map<String, dynamic> toJson() => {"auth_token": _authToken};
}

class ValidateResponse {
  ValidateResponse({
    required int responseCode,
    required String responseMessage,
    required String name,
    required String surname,
    required String email,
    required String pemString,
  }) : _responseCode = responseCode,
       _responseMessage = responseMessage,
       _name = name,
       _surname = surname,
       _email = email,
       _pemString = pemString;

  final int _responseCode;
  final String _responseMessage;
  final String _name;
  final String _surname;
  final String _email;
  final String _pemString;

  int get responseCode => _responseCode;
  String get responseMessage => _responseMessage;
  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  String get pemString => _pemString;

  ValidateResponse.fromJson(Map<String, dynamic> json)
    : _responseCode = json["response_code"],
      _responseMessage = json["response_message"],
      _name = json["name"],
      _surname = json["surname"],
      _email = json["email"],
      _pemString = json["pem_string"];
}
