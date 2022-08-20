import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';
import 'package:scaffold/utils/routing/navbarController.dart';
import 'elements/BottomNavBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.05),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  final List<GlobalKey<NavigatorState>> keys = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.reset();
    _controller.forward();
    for (int i = 0; i < NUMBER_OF_BOTTOM_ELEMENTS; i++)
      keys.add(GlobalKey<NavigatorState>());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppConstants().calculateSize(context);
    NavbarController.setKeys(keys);
    if (NavbarController.routeDetails.length == NUMBER_OF_BOTTOM_ELEMENTS)
      return;
    NavbarController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool _checkIfExiting =
              await NavbarController.checkIfExitingOrNavigate();
          setState(() {});
          if (!_checkIfExiting) {
            return false;
          }
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return EXIT_ALERT(context);
              });
          return value == true;
        },
        child: Scaffold(
            body: IndexedStack(children: [
              for (int index = 0;
                  index < NavbarController.routeDetails.length;
                  index++)
                SlideTransition(
                    position: _offsetAnimation,
                    child: Navigator(
                      key: keys[index],
                      initialRoute: '/',
                      onGenerateRoute:
                          NavbarController.routeDetails[index].onGenerateRoute,
                    ))
            ], index: NavbarController.currentIndex),
            bottomNavigationBar: BottomNav(
              animationController: _controller,
              onSelect: (selectedIndex) {
                setState(() {});
              },
            )));
  }
}
