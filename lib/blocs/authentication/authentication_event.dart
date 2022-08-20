import 'package:equatable/equatable.dart';
import 'package:scaffold/models/models.dart';

import '../../repos/repos.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  final AuthenticationStatus status = AuthenticationStatus.unknown;

  @override
  List<Object> get props => [status];
}

class AppLoaded extends AuthenticationEvent {}

class AuthLoading extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {
  final Register registerData;
  UserLoggedIn({required this.registerData});

  @override
  List<Object> get props => [registerData];
}

class AuthFailed extends AuthenticationEvent {
  final String message;
  AuthFailed({required this.message});

  @override
  List<Object> get props => [];
}

class UserLoggedOut extends AuthenticationEvent {}
