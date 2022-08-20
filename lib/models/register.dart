class Register {
  String? email;
  String? password;
  String? name;
  String token = '';

  Register({this.email, this.password, this.name, required this.token});

  Register.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() => 'Register { name: $name, email: $email, token: $token}';
}
