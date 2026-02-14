class SignOutRequest {
  SignOutRequest({required String email}) : _email = email;

  final String _email;

  Map<String, dynamic> toJson() => {"email": _email};
}

class SignOutResponse {
  SignOutResponse({required int responseCode, required String responseMessage})
    : _responseCode = responseCode,
      _responseMessage = responseMessage;

  final int _responseCode;
  final String _responseMessage;

  int get responseCode => _responseCode;
  String get responseMessage => _responseMessage;

  SignOutResponse.fromJson(Map<String, dynamic> json)
    : _responseCode = json["response_code"],
      _responseMessage = json["response_message"];
}
