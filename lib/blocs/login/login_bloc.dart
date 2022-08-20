import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:scaffold/blocs/authentication/authentication.dart';
import 'package:scaffold/repos/authentication_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationService;
  final AuthenticationBloc _authenticationBloc;
  LoginBloc(AuthenticationBloc authBloc,
      AuthenticationRepository authenticationService)
      : _authenticationService = authenticationService,
        _authenticationBloc = authBloc,
        super(LoginInitial()) {
    on<Login>(_mapLoginToState);
    on<Register>(_mapRegisterToState);
  }
  Future _mapLoginToState(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    _authenticationBloc.add(AuthLoading());
    try {
      final registerData =
          await _authenticationService.login(event.email, event.password);
      _authenticationBloc.add(UserLoggedIn(registerData: registerData));
      emit(LoginSuccess());
      emit(LoginInitial());
    } catch (err) {
      _authenticationBloc.add(AuthFailed(message: 'Error: $err'));
    }
  }

  Future _mapRegisterToState(Register event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    _authenticationBloc.add(AuthLoading());
    try {
      final registerData = await _authenticationService.register(
          event.email, event.password, event.name);
      _authenticationBloc.add(UserLoggedIn(registerData: registerData));
      emit(LoginSuccess());
      emit(LoginInitial());
    } catch (err) {
      _authenticationBloc.add(AuthFailed(message: 'Error: $err'));
    }
  }
}
