import 'package:flutter/material.dart';

import '../../utils/consts.dart';
import '../elements/TabBar/bookings_dashboard__tab_bar.dart';
import '../elements/drop_down-2.dart';
import 'CustomScaffold.dart';

class BookingDashBoardPage extends StatefulWidget {
  const BookingDashBoardPage({Key? key}) : super(key: key);

  @override
  State<BookingDashBoardPage> createState() => _BookingDashBoardPageState();
}

class _BookingDashBoardPageState extends State<BookingDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: V_LARGE_PAD_VER,left: V_LARGE_PAD_HOR,bottom: SMALL_PAD_VER),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                Text(
                  "Bookings",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: V_LARGE_FONT_SIZE),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
            child: DropDown2(),
          ),
          Expanded(child: BookingDashBoardTabBar()),
        ],
      ),
    );
  }
}
