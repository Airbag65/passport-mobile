class LocalAuth {
  const LocalAuth({
    required String name,
    required String surname,
    required String email,
    required String authToken,
  }) : _name = name,
       _surname = surname,
       _email = email,
       _authToken = authToken;

  final String _name;
  final String _surname;
  final String _email;
  final String _authToken;

  LocalAuth.fromJson(Map<String, dynamic> json)
    : _name = json["name"],
      _surname = json["surname"],
      _email = json["email"],
      _authToken = json["auth_token"];

  Map<String, dynamic> toJson() => {
    "name": _name,
    "surname": _surname,
    "email": _email,
    "auth_token": _authToken,
  };
}
