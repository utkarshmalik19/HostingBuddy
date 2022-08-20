import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/TabBar/schedule_tab_bar.dart';

import '../elements/drop_down-2.dart';
import 'CustomScaffold.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 35, bottom: 15),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                Text(
                  "Schedule",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 36, bottom: 25),
            child: DropDown2(),
          ),
          ScheduleTabBar()
        ],
      ),
      //  bottomNavigationBar: BottomNav(),
    );
  }
}
