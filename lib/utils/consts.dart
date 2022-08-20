// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:scaffold/utils/routing/navbarController.dart';
import 'package:scaffold/utils/routing/rootRoutes.dart';

part 'utils.dart';

class AppConstants {
  double height = 0;
  double width = 0;
  double aspectRatio = 0;
  double _heightCalculator(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return (MediaQuery.of(context).size.height);
  }

  double _widthCalculator(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return (MediaQuery.of(context).size.width);
  }

  _calculateAspectRatio(double width, double height) => height / width;

  static final AppConstants _instance = AppConstants._internal();
  factory AppConstants() {
    return _instance;
  }
  AppConstants._internal();

  void calculateSize(BuildContext context) {
    aspectRatio = _calculateAspectRatio(
        _widthCalculator(context), _heightCalculator(context));
  }
}

const Map<int, Color> colorCodes = {
  50: Color(0XFFF3F1FF),
  100: Color(0XFFF3F1FF),
  200: Color(0XFFF3F1FF),
  300: Color(0XFFF3F1FF),
  400: Color(0xFFDFDAFF),
  500: Color(0xFFDFDAFF),
  600: Color(0xFFDFDAFF),
  700: Color(0xFF8F7EF3),
  800: Color(0xFF8F7EF3),
  900: Color(0xFF8F7EF3),
};

/////////////Commons\\\\\\\\\\\\\\
const THEME_COLOR = MaterialColor(0xFF8F7EF3, colorCodes);
double INVERSE_ASPECT_RATIO = 1 / AppConstants().aspectRatio;
const double MARGIN_MULTIPLIER = 0.1;
// Horizontal Padding
double V_LARGE_PAD_HOR = AppConstants().width * 0.092; //36
double LARGE_PAD_HOR = AppConstants().width * 0.082; //32
double MEDIUM_PAD_HOR = AppConstants().width * 0.072; //28
double MEDIUM_PAD_2_HOR = AppConstants().width * 0.061; //24
double SMALL_PAD_HOR = AppConstants().width * 0.041; //16
double V_SMALL_PAD_HOR = AppConstants().width * 0.02; //8

// Vertical Padding
double V_LARGE_PAD_VER = AppConstants().height * 0.049; //42
double LARGE_PAD_VER = AppConstants().height * 0.042; //36
double MEDIUM_PAD_VER = AppConstants().height * 0.033; //28
double MEDIUM_PAD_2_VER = AppConstants().height * 0.023; //20
double SMALL_PAD_VER = AppConstants().height * 0.019; //16
double V_SMALL_PAD_VER = AppConstants().height * 0.0118; //10
double VV_SMALL_PAD_VER = AppConstants().height * 0.007; //6
// const double VV_SMALL_PAD = 2;
// const double VVV_SMALL_PAD = 1.5;
const double RADIUS = 10;
const double LIST_RADIUS = 50;
const double RADIUS_SMALL = 10;
const double FORM_FIELD_RADIUS = 32;
// Font Size
double V_LARGE_FONT_SIZE = AppConstants().height * 0.033; //28
double LARGE_FONT_SIZE = AppConstants().height * 0.0236; //20
double MED_FONT_SIZE_2 = AppConstants().height * 0.021; //18
double MED_FONT_SIZE = AppConstants().height * 0.019; //16
double REGULAR_FONT_SIZE = AppConstants().height * 0.016; //14
double DEFAULT_FONT_SIZE = AppConstants().height * 0.014; //12
double SMALL_FONT_SIZE = AppConstants().height * 0.0118; //10

List<Color> TEXT_COLOR = [
  Color(0xff6053AE),
  Color(0xffAD6800),
  Color(0xff2F8C21),
  Color(0xff0D8CB2)
];
List<Color> BG_COLOR = [
  Color(0xffF3F1FF),
  Color(0xffF2F0DF),
  Color(0xffEEFCEC),
  Color(0xffEAF7FB)
];
List<Color> BUTTON_COLOR = [
  Color(0xffDFDAFF),
  Color(0xffF4CF97),
  Color(0xffB7E2AD),
  Color(0xff6EC4EB)
];
const double TEXT_FIELD_ELEVATION = 8;
const double TEXT_FIELD_BORDER_RADIUS = 5;
const Color TEXT_FIELD_ICON_COLOR = Colors.black;
const Color TEXT_FIELD_CURSOR_COLOR = Colors.black;
const Color OVERLAY_BG_COLOR = Colors.black38;
const FontWeight BOLD_WEIGHT = FontWeight.w700;
const FontWeight NORMAL_WEIGHT = FontWeight.w500;
const Color TEXT_COLOR_BRIGHT = Color(0XFFF0DBA5);
const Color TEXT_COLOR_DARK = Color(0XFF5D1815);
double SCREEN_RATIO = AppConstants().height / AppConstants().width;
const double BG_MUSIC_VOLUME_LEVEL = 0.7;
const Color NON_IMAGE_BG_COLOR = Color(0XFFFFF7CC);
const APP_TITLE = 'Flutter Scaffold';
const SECURE_STORAGE_TOKEN_KEY = 'token';

///////////////////////////Server\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
const String SERVER_URL = 'https://game.simplem.in';
const int SERVER_TIMEOUT = 5;
const String HTTP_CONTENT_TYPE = 'application/json';

const String USER_LOAD_URL = '/api/auth/user';
const String USER_LOGIN_URL = '/api/auth/user/host/login';
const String USER_REGISTER_URL = '/api/auth/user/host/register';

//Errors
const String NO_CONNECTION_ERROR = 'Host Not Found';
const String BAD_REQUEST_ERROR = 'Bad Request';
const String NOT_FOUND_ERROR = 'Not Found';
const String SERVER_INTERNAL_ERROR = 'Server Internal Error';

///////////////////////////UI\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//Page Paths
const String HOME_PATH = '/home';

const String SPLASH_PATH = '/splash';
const String LOGIN_PATH = '/login';

//Bottom Nav Consts
const NAV_ICON_EXTENSION = 'png';
const NAV_SELECTED_SUFFIX = '_selected';
const NUMBER_OF_BOTTOM_ELEMENTS = 5;

abstract class ContainerParent extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  ContainerParent({required this.navigatorKey});
}

const DASHBOARD_NAV_LABEL = 'Dashboard';
RouteDestination firstRoute = RouteDestination(
    baseIconImg: 'assets/navbar/nav_dashboard',
    label: DASHBOARD_NAV_LABEL,
    onGenerateRoute: dashOnGenerateRoute);
const BOOKING_NAV_LABEL = 'Bookings';
RouteDestination secondRoute = RouteDestination(
    baseIconImg: 'assets/navbar/nav_bookings',
    label: BOOKING_NAV_LABEL,
    onGenerateRoute: bookingOnGenerateRoute);

const INQUIRY_NAV_LABEL = 'Inquiries';
RouteDestination thirdRoute = RouteDestination(
    baseIconImg: 'assets/navbar/nav_inquiries',
    label: INQUIRY_NAV_LABEL,
    onGenerateRoute: inquiryOnGenerateRoute);

const SCHEDULE_NAV_LABEL = 'Schedule';
RouteDestination fourthRoute = RouteDestination(
    baseIconImg: 'assets/navbar/nav_schedule',
    label: SCHEDULE_NAV_LABEL,
    onGenerateRoute: scheduleOnGenerateRoute);

const PROFILE_NAV_LABEL = 'Profile';
RouteDestination fifthRoute = RouteDestination(
    baseIconImg: 'assets/navbar/nav_profile',
    label: PROFILE_NAV_LABEL,
    onGenerateRoute: profileOnGenerateRoute);

//Auth Page Consts
const double AUTH_PAGE_BUFFER_MULTIPLE = 1.2;
const String AUTH_HEADER_PATH = 'assets/img/auth_head.svg';
const Color AUTH_PAGE_START_GRADIENT = Color(0XFFFF9A9E);
const Color AUTH_PAGE_END_GRADIENT = Color(0XFFFAD0C4);
const Color AUTH_BUTTON_COLOR = Color(0xFF073A93);
const Radius AUTH_BUTTON_RADIUS = Radius.circular(5);
const String EMAIL_PATTERN =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const int MINIMUM_NAME_LENGTH = 4;
const int MINIMUM_PASSWORD_LENGTH = 6;
const EdgeInsets FORM_PADDING = EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0);
const EdgeInsets FORM_REGISTER_PADDING =
    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0);

AlertDialog EXIT_ALERT(BuildContext context) => AlertDialog(
      content: Text('Are you sure you want to exit?'),
      actions: <Widget>[
        TextButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text('Yes, exit'),
          onPressed: () {
            if (Platform.isAndroid) SystemNavigator.pop();
          },
        ),
      ],
    );

List<String> titles = [
  'Check-in',
  'Requests',
  'Confirmed',
  'Completed',
  'Cancelled'
];

// Padding and Font Size const
double V_LARGE_TEXT = AppConstants().height * 0.033; //28
double LARGE_TEXT = AppConstants().height * 0.023; //20
double MED_TEXT = AppConstants().height * 0.018; //16
double MED_TEXT_2 = AppConstants().height * 0.016; // Font size 14
double SMALL_TEXT = AppConstants().height * 0.014;
