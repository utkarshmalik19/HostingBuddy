import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/Alert.dart';
import 'package:scaffold/repos/repos.dart';
import 'blocs.dart';

class BlocProviders {
  //ignore: close_sinks
  static AlertsBloc _alertsBloc = AlertsBloc();

  //ignore: close_sinks
  static AuthenticationBloc _authBloc =
      AuthenticationBloc(AuthenticationRepository())..add(AppLoaded());
  //ignore: close_sinks
  static LoginBloc _loginBloc =
      LoginBloc(_authBloc, AuthenticationRepository());

  var _authBlocProvider = BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => _authBloc);

  var _alertsBlocProvider =
      BlocProvider<AlertsBloc>(create: (BuildContext context) => _alertsBloc);

  var _loginBlocProvicer = BlocProvider<LoginBloc>.value(value: _loginBloc);

  List<BlocProvider> getMainProviders() {
    return [_authBlocProvider, _alertsBlocProvider];
  }

  List<BlocProvider> getLoginProviders() {
    return [_loginBlocProvicer];
  }

  BlocListener alertListner(BuildContext context) {
    return BlocListener<AlertsBloc, AlertsState>(listener: (context, state) {
      if (state is AlertMessage) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar(message: state.message));
      }
    }, listenWhen: (_, __) {
      var route = ModalRoute.of(context);
      return route?.isCurrent ?? false;
    });
  }

  void disposeBlocs() {
    _authBloc.close();
    _loginBloc.close();
    _alertsBloc.close();
  }
}
