import 'package:bloc/bloc.dart';
import 'package:scaffold/blocs/authentication/authentication.dart';

import '../../repos/repos.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationRepository authenticationService)
      : _authenticationService = authenticationService,
        super(AuthenticationInitial()) {
    on<AuthLoading>(_mapAuthLoadingToState);
    on<AppLoaded>(_mapAppLoadedToState);
    on<UserLoggedIn>(_mapUserLoggedInToState);
    on<UserLoggedOut>(_mapUserLoggedOutToState);
    on<AuthFailed>(_mapAuthFailedToState);
  }

  final AuthenticationRepository _authenticationService;

  Future _mapAuthLoadingToState(
      AuthLoading event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
  }

  Future _mapAppLoadedToState(
      AppLoaded event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await _authenticationService.getToken();
      final currentUser = await _authenticationService.loadUser();
      emit(AuthenticationUserLoaded(user: currentUser));
    } catch (e) {
      print(e);
      emit(AuthenticationNotAuthenticated());
    }
  }

  Future _mapUserLoggedInToState(
      UserLoggedIn event, Emitter<AuthenticationState> emit) async {
    try {
      await _authenticationService.setToken(event.registerData.token);
      final currentUser = await _authenticationService.loadUser();
      emit(AuthenticationUserLoaded(user: currentUser));
    } catch (e) {
      emit(AuthenticationNotAuthenticated());
    }
  }

  Future _mapUserLoggedOutToState(
      UserLoggedOut event, Emitter<AuthenticationState> emit) async {
    await _authenticationService.logOut();
    emit(AuthenticationNotAuthenticated());
  }

  Future _mapAuthFailedToState(
      AuthFailed event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationFailure(message: event.message));
  }
}
