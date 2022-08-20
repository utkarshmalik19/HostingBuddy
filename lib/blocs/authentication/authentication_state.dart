import 'package:equatable/equatable.dart';
import 'package:scaffold/repos/repos.dart';
import '../../models/models.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status});
  final AuthenticationStatus status;
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial() : super(status: AuthenticationStatus.unknown);
}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading() : super(status: AuthenticationStatus.loading);
}

class AuthenticationNotAuthenticated extends AuthenticationState {
  AuthenticationNotAuthenticated()
      : super(status: AuthenticationStatus.unauthenticated);
}

class AuthenticationAuthenticated extends AuthenticationState {
  final Register registerData;

  AuthenticationAuthenticated({required this.registerData})
      : super(status: AuthenticationStatus.authenticated);

  @override
  List<Object> get props => [registerData];
}

class AuthenticationUserLoaded extends AuthenticationState {
  final User user;

  AuthenticationUserLoaded({required this.user})
      : super(status: AuthenticationStatus.authenticated);

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({required this.message})
      : super(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [];
}
