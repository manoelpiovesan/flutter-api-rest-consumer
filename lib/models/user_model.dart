class User {
  String name;
  String email;
  String password;

  User({required this.name, required this.email, required this.password});

  fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

  toMap() => {
    'name': name,
    'email': email,
    'password': password,
  };
}
