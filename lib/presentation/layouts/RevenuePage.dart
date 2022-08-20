import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../elements/TabBar/revenue_tab_bar.dart';
import '../elements/drop_down-2.dart';
import 'CustomScaffold.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({Key? key}) : super(key: key);

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: V_LARGE_PAD_VER,
                  left: V_LARGE_PAD_VER,
                  bottom: SMALL_PAD_VER),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  Text(
                    "Revenue",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: V_LARGE_FONT_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
              child: DropDown2(),
            ),
            Expanded(child: RevenueTabBar())
          ],
        ));
  }
}
