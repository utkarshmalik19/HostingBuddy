import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/drop_down-2.dart';
import 'package:scaffold/utils/consts.dart';

import '../elements/TabBar/nav_booking_tab_bar.dart';
import 'CustomScaffold.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  int _selectedType = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR, top: AppConstants().height*0.059, bottom: MEDIUM_PAD_2_VER),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Text("Bookings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: V_LARGE_FONT_SIZE,
                        color: Colors.black)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: V_LARGE_PAD_HOR, right: V_LARGE_PAD_HOR, bottom: MEDIUM_PAD_VER),
            child: DropDown2(),
          ),
          Container(
            height: AppConstants().height * 0.07,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => setState(() {
                      _selectedType = index;
                    }),
                    child: Padding(
                        padding:  EdgeInsets.all(AppConstants().width*0.01),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: AppConstants().height*0.004, horizontal: AppConstants().width*0.051),
                          decoration: BoxDecoration(
                              color: Color(_selectedType == index
                                  ? 0xFF8F7EF3
                                  : 0xffF3F1FF)),
                          child: Center(
                            child: Text(
                              titles[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: REGULAR_FONT_SIZE),
                            ),
                          ),
                        )),
                  );
                }),
          ),
          Expanded(child: BookingsBar(bookingType: titles[_selectedType])),
        ],
      ),
    );
  }
}
