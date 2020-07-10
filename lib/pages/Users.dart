class Users {
  String name;
  String email;
  String token;
  String login;

  List<String> roles;

  Users.fromJson(Map<String, dynamic> map)
      : name = map["nome"],
        email = map["email"],
        token = map["token"],
        login = map["login"],
        roles = map["roles"] != null
            ? map["roles"].map<String>((role) => role.toString()).toList()
            : null;

  @override
  String toString() {
    return "User{login: $login;\n name: $name;\n email: $email;\n token: $token;\n role: $roles}";
  }
}
