import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaffold/blocs/bloc_providers.dart';
import 'package:scaffold/models/router_arguments.dart';
import 'package:scaffold/presentation/elements/inquiry_details.dart';
import 'package:scaffold/presentation/layouts/BookingsPage.dart';
import 'package:scaffold/presentation/layouts/DashBoardPage.dart';
import 'package:scaffold/presentation/layouts/InquiryPage.dart';
import 'package:scaffold/presentation/layouts/ProfilePage.dart';
import 'package:scaffold/presentation/layouts/ReviewPage.dart';
import 'package:scaffold/presentation/layouts/SchedulePage.dart';
import 'package:scaffold/utils/consts.dart';
import 'package:scaffold/presentation/HomePage.dart';
import 'package:scaffold/presentation/layouts/SplashPage.dart';
import 'package:scaffold/presentation/authLayouts/LoginPage.dart';

class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_PATH:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                providers: BlocProviders().getLoginProviders(),
                child: SplashPage()),
            settings: settings);
      case LOGIN_PATH:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                providers: BlocProviders().getLoginProviders(),
                child: LoginPage(
                  key: Key("login"),
                )),
            settings: settings);
      case HOME_PATH:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                providers: BlocProviders().getMainProviders(),
                child: HomePage()),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Text(
                      'Please check route definition for ${settings.name}'),
                ));
    }
  }

  void disposeBlocs() {
    BlocProviders().disposeBlocs();
  }
}

Route bookingOnGenerateRoute(RouteSettings settings) {
  late Widget page = BookingsPage();
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route dashOnGenerateRoute(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case '/':
      page = DashboardPage();
      break;
    case '/reviewPage':
      page = ReviewPage();
      break;
    default:
      break;
  }
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route inquiryOnGenerateRoute(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case '/':
      page = InquiriesPage();
      break;
    case '/details':
      var arguments = settings.arguments as InquiryDetailArguments;
      page = InquiryDetails(
        list: arguments.list,
        initalSelectedIndex: arguments.initalSelectedIndex,
      );
      break;
  }
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route profileOnGenerateRoute(RouteSettings settings) {
  late Widget page = ProfilePage();
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route scheduleOnGenerateRoute(RouteSettings settings) {
  late Widget page = SchedulePage();
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
