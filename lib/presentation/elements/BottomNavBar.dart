import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';
import 'package:scaffold/utils/routing/navbarController.dart';

class BottomNav extends StatefulWidget {
  const BottomNav(
      {Key? key, required this.onSelect, required this.animationController})
      : super(key: key);
  final Function(int) onSelect;
  final AnimationController animationController;
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.073,
      child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: List.generate(
              NavbarController.routeDetails.length,
              (index) => BottomNavigationBarItem(
                  icon: NavbarController.routeDetails[index].icon,
                  label: NavbarController.routeDetails[index].label)),
          currentIndex: NavbarController.currentIndex,
          selectedItemColor: Colors.black,
          onTap: (selectedIndex) {
            if (selectedIndex == NavbarController.currentIndex) {
              NavbarController.clearAllRoutes(selectedIndex);
            } else {
              NavbarController.index = selectedIndex;
              widget.animationController.reset();
              widget.animationController.forward();
            }
            widget.onSelect(selectedIndex);
          },
          elevation: 5),
    );
  }
}
