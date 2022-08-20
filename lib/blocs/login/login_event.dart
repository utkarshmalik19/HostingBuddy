import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class Register extends LoginEvent {
  final String email;
  final String password;
  final String name;

  Register({required this.email, required this.password, required this.name});

  @override
  List<Object> get props => [email, password, name];
}
