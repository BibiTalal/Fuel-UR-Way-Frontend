class User {
  String? username;
  String? password;

  String? email;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }
}
