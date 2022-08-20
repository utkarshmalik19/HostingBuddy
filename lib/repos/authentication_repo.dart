import 'dart:async';
import 'package:scaffold/utils/consts.dart';
import 'package:scaffold/utils/networking/RestWrapper.dart';
import 'package:scaffold/models/models.dart';

enum AuthenticationStatus { loading, unknown, authenticated, unauthenticated }

abstract class AuthenticationService {
  Future<Register> register(String email, String password, String name);
  Future<User> loadUser();
  Future<Register> login(String email, String password);
  void setToken(String token);
  Future<void> logOut();
  Future<String> getToken();
}

class AuthenticationRepository extends AuthenticationService {
  RestWrapper _provider = RestWrapper();
  @override
  Future<Register> register(String email, String password, String name) async {
    final response = await _provider.post(USER_REGISTER_URL,
        {'email': email, 'password': password, 'name': name});
    return Register.fromJson(response);
  }

  @override
  Future<Register> login(String email, String password) async {
    final Map<String, dynamic> response = await _provider
        .post(USER_LOGIN_URL, {'email': email, 'password': password});
    return Register.fromJson(response);
  }

  @override
  Future<User> loadUser() async {
    final Map<String, dynamic> response = await _provider.get(USER_LOAD_URL);
    return User.fromJson(response);
  }

  @override
  Future<void> setToken(String token) async {
    await _provider.setToken(token);
    return;
  }

  @override
  Future<String> getToken() async {
    final token = await _provider.jwtOrEmpty();
    if (token != "") {
      await setToken(token);
    }
    return token;
  }

  @override
  Future<void> logOut() async {
    await _provider.clearToken();
    return null;
  }
}
