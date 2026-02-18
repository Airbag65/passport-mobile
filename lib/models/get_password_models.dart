class GetPasswordRequest {
  GetPasswordRequest({required String hostName}) : _hostName = hostName;
  final String _hostName;

  Map<String, dynamic> toJson() => {"host_name": _hostName};
}

class GetPasswordResponse {
  GetPasswordResponse({required String password}) : _password = password;
  final String _password;

  String get password => _password;

  GetPasswordResponse.fromJson(Map<String, dynamic> json)
    : _password = json["password"];
}

class RemovePasswordRequest {
  RemovePasswordRequest({required String hostName}) : _hostName = hostName;
  final String _hostName;

  Map<String, dynamic> toJson() => {"host_name": _hostName};
}

class AddPasswordRequest {
  AddPasswordRequest({required String hostName, required String password})
    : _hostName = hostName,
      _password = password;

  final String _hostName;
  final String _password;

  Map<String, dynamic> toJson() => {
    "host_name": _hostName,
    "password": _password,
  };
}
