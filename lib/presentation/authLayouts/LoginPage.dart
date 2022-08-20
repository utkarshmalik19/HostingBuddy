import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/repos/repos.dart';
import 'package:scaffold/utils/consts.dart';

import '../../blocs/bloc_providers.dart';
import '../../blocs/blocs.dart';

class LoginPage extends StatefulWidget {
  LoginPage({required Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController _emailInputController;
  late TextEditingController _pwdInputController;
  bool _isPwdObscure = true;
  bool _isEmailCorrect = false;

  @override
  initState() {
    _emailInputController = new TextEditingController();
    _pwdInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConstants().calculateSize(context);
    return MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
            if (state is AuthenticationUserLoaded) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HOME_PATH, (Route<dynamic> route) => false);
            } else if (state is AuthenticationFailure) {
              context.read<AlertsBloc>().add(AddAlert(message: 'Login Failed'));
            }
          }),
          BlocProviders().alertListner(context)
        ],
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.07, left: AppConstants().width*0.153, bottom: AppConstants().height*0.0356),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    )),
              ),
              Image.asset("assets/img/final_logo.png"),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextFormField(
                        controller: _emailInputController,
                        decoration: InputDecoration(
                          suffixIcon: _isEmailCorrect
                              ? Image.asset("assets/img/Tick.png")
                              : null,
                          labelText: 'Email Address',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: TextFormField(
                        obscureText: _isPwdObscure,
                        controller: _pwdInputController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: _isPwdObscure
                                ? Icon(Icons.remove_red_eye_rounded)
                                : Icon(Icons.remove_red_eye_outlined),
                            onPressed: (() => setState(() {
                                  _isPwdObscure = !_isPwdObscure;
                                })),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 32.0, top: 24, bottom: 60),
                          child: GestureDetector(
                              onTap: () {}, child: Text("Forgot Password?")),
                        )),
                    SizedBox(
                      width: AppConstants().width * 0.85,
                      height: AppConstants().height * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(Login(
                                email: _emailInputController.text,
                                password: _pwdInputController.text));
                          },
                          child: SizedBox(
                            height: AppConstants().height * 0.045,
                            child: BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
                              builder: (context, state) {
                                return state.status ==
                                        AuthenticationStatus.loading
                                    ? CircularProgressIndicator()
                                    : Center(child: Text("Start Hosting"));
                              },
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
