import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold/utils/routing/rootRoutes.dart';
import 'package:scaffold/utils/consts.dart';
import 'package:scaffold/blocs/bloc_providers.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Routes _routes = Routes();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiBlocProvider(
      providers: BlocProviders().getMainProviders(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
              title: APP_TITLE,
              theme: ThemeData(
                  primarySwatch: THEME_COLOR,
                  textTheme: GoogleFonts.openSansTextTheme(
                    Theme.of(context).textTheme,
                  )),
              onGenerateRoute: _routes.generateRoute,
              initialRoute: SPLASH_PATH);
        },
      ),
    );
  }

  @override
  void dispose() {
    _routes.disposeBlocs();
    super.dispose();
  }
}
