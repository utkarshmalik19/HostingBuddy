class User {
  String? email;
  String? name;
  bool? emailVerified;
  String? avatar;

  User({this.email, this.name, this.emailVerified, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    emailVerified = json['emailVerified'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['emailVerified'] = this.emailVerified;
    data['avatar'] = this.avatar;
    return data;
  }

  @override
  String toString() => 'User { name: $name, email: $email, avatar: $avatar}';
}
