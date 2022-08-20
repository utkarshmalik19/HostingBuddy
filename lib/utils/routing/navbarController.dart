import 'dart:async';

import 'package:flutter/material.dart';

import '../consts.dart';

class NavbarController {
  static final NavbarController _singleton = NavbarController._internal();

  factory NavbarController() {
    return _singleton;
  }

  NavbarController._internal() {
    initializeRoutes();
  }
  static int _index = 0;

  static int get currentIndex => _index;

  static List<GlobalKey<NavigatorState>> get keys => _keys;

  static List<int> _navbarStackHistory = [0];

  static List<RouteDestination> _routes = [];

  static List<GlobalKey<NavigatorState>> _keys =
      []; //TODO: Figure if we need a better way? Can we make it a part of class?

  static void setKeys(List<GlobalKey<NavigatorState>> keys) => _keys = keys;

  static set index(int x) {
    if (x == _index) return;
    _index = x;
    _navbarStackHistory.add(x);
    updateSelected();
  }

  static List<int> get navbarStackHistory => _navbarStackHistory;

  static List<RouteDestination> get routeDetails => _routes;

  static FutureOr<bool> checkIfExitingOrNavigate() async {
    bool exitingApp = true;
    NavigatorState? currentState;
    for (int i = 0; i < routeDetails.length; i++) {
      if (_index == i) {
        currentState = _keys[i].currentState;
      }
    }
    if (currentState != null && currentState.canPop()) {
      currentState.pop();
      exitingApp = false;
    } else if (_navbarStackHistory.length > 1) {
      _navbarStackHistory.removeLast();
      _index = _navbarStackHistory.last;
      updateSelected();
      exitingApp = false;
    }
    if (exitingApp) {
      return true;
    } else {
      return false;
    }
  }

  static void clearAllRoutes(int index) {
    NavigatorState? currentState;
    for (int i = 0; i < routeDetails.length; i++) {
      if (_index == i) {
        currentState = _keys[currentIndex].currentState;
      }
    }
    if (currentState != null && currentState.canPop()) {
      currentState.popUntil((route) => route.isFirst);
    }
  }

  void initializeRoutes() {
    firstRoute.isSelected = true;
    _routes
        .addAll([firstRoute, secondRoute, thirdRoute, fourthRoute, fifthRoute]);
  }

  static void updateSelected() {
    _routes.asMap().forEach((routeIndex, route) {
      route.isSelected = routeIndex == _index;
    });
  }
}

class RouteDestination {
  final String baseIconImg;
  Widget icon;
  final String label;
  final RouteFactory? onGenerateRoute;

  RouteDestination(
      {required this.baseIconImg,
      this.icon = const Icon(Icons.clear),
      required this.onGenerateRoute,
      required this.label}) {
    icon = Image.asset("$baseIconImg.$NAV_ICON_EXTENSION",
        height: AppConstants().height * 0.025);
  }

  set isSelected(_isSelected) {
    icon = Image.asset(
        "$baseIconImg${_isSelected ? NAV_SELECTED_SUFFIX : ''}.$NAV_ICON_EXTENSION",
        height: AppConstants().height * (_isSelected ? 0.02 : 0.025));
  }
}
