import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scaffold/utils/consts.dart';
import '../RescheduleDialog.dart';

class RequestsBookingCard extends StatelessWidget {
  final int index;
  RequestsBookingCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants().width * 0.025),
        child: Card(
          color: BG_COLOR[index],
          child: Padding(
            padding: EdgeInsets.only(left: SMALL_PAD_HOR),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SMALL_PAD_VER,
                      ),
                      child: CircleAvatar(
                          child: Image.asset("assets/img_1.png")), //model
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppConstants().height * 0.029,
                          left: AppConstants().width * 0.025,
                          right: AppConstants().width * 0.23),
                      //widget.list.name[index] showing error  '[]' was called on null
                      child: Text(
                        "name",
                        style: TextStyle(
                            fontSize: MED_FONT_SIZE,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppConstants().width * 0.175,
                          top: MEDIUM_PAD_2_VER),
                      child: Column(
                        children: [
                          Text(
                            "Additional Charges",
                            style: TextStyle(fontSize: SMALL_FONT_SIZE),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff24BA0E))),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppConstants().width * 0.01),
                              child: Center(
                                child: Text(
                                  "₹500",
                                  style: TextStyle(color: Color(0xff24BA0E)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: VV_SMALL_PAD_VER),
                  child: Row(
                    children: [
                      Text("Thinnai  : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppConstants().width * 0.153),
                        child: Text(
                          "By The Way",
                          style: TextStyle(
                              color: TEXT_COLOR[index],
                              fontSize: DEFAULT_FONT_SIZE),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppConstants().height * 0.0094),
                  child: Row(
                    children: [
                      Text("No. of guests : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppConstants().width * 0.153),
                        child: Text(
                          "6",
                          style: TextStyle(
                              color: TEXT_COLOR[index],
                              fontSize: DEFAULT_FONT_SIZE),
                        ), //model
                      ), //model

                      Text("Time : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Text(
                        "3.00-6.00 pm",
                        style: TextStyle(
                            color: TEXT_COLOR[index],
                            fontSize: DEFAULT_FONT_SIZE),
                      ) //model
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Group type      : ",
                        style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Padding(
                      padding: EdgeInsets.only(right: LARGE_PAD_HOR),
                      child: Text(
                        "Family",
                        style: TextStyle(
                            color: TEXT_COLOR[index],
                            fontSize: DEFAULT_FONT_SIZE),
                      ),
                    ), //model
                    Text("Date : ",
                        style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Text(
                      "30.06.22",
                      style: TextStyle(
                          color: TEXT_COLOR[index],
                          fontSize: DEFAULT_FONT_SIZE),
                    ) //model
                  ],
                ),
                Row(
                  children: [
                    Text("Paid Amount  : ",
                        style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Padding(
                      padding: EdgeInsets.only(right: LARGE_PAD_HOR),
                      child: Text(
                        "1000",
                        style: TextStyle(
                            fontSize: DEFAULT_FONT_SIZE,
                            color: TEXT_COLOR[index]),
                      ),
                    ), //model
                    Text(
                      "✔ Booking accepted on 24.12.22",
                      style: TextStyle(
                          color: Colors.grey, fontSize: DEFAULT_FONT_SIZE),
                    ),
                    //model
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppConstants().height * 0.0094,
                      horizontal: AppConstants().width * 0.028),
                  child: Divider(
                    height: VV_SMALL_PAD_VER,
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                  child: Text(
                    " Requested changes",
                    style: TextStyle(
                        fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text("  Date  : ",
                        style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Padding(
                      padding: EdgeInsets.only(right: V_LARGE_PAD_HOR),
                      child: Text("01.07.22",
                          style: TextStyle(
                              fontSize: DEFAULT_FONT_SIZE,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)),
                    ), //model
                    Text(
                      "24.12.22",
                      style: TextStyle(
                          color: TEXT_COLOR[index],
                          fontSize: DEFAULT_FONT_SIZE),
                    ),
                    //model
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants().width * 0.013),
                      child: Text("Time  :",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: AppConstants().width * 0.025),
                      child: Text(
                        "3:00-6:00 pm",
                        style: TextStyle(
                            fontSize: DEFAULT_FONT_SIZE,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ), //model
                    Text(
                      "4:00-6:00 pm",
                      style: TextStyle(
                          color: TEXT_COLOR[index],
                          fontSize: DEFAULT_FONT_SIZE),
                    ),
                    //model
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                  child: Row(
                    children: [
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         elevation: 0,
                      //         minimumSize: Size(AppConstants().width*0.256, LARGE_PAD_VER),
                      //         primary: BUTTON_COLOR[index] //model
                      //         ),
                      //     onPressed: () {},
                      //     child: Text(
                      //       "Reschedule",
                      //       style: TextStyle(color: Colors.black),
                      //     )),
                      RescheduleButton(
                        index: index,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants().width * 0.028),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                side: BorderSide(color: Colors.black),
                                minimumSize: Size(AppConstants().width * 0.256,
                                    LARGE_PAD_VER),
                                primary: BG_COLOR[index] //model
                                ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: SvgPicture.asset(
                                      "assets/img/decline.svg"),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(V_SMALL_PAD_HOR),
                                          child: Center(
                                            child: Text(
                                              "Are you sure ?",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "On cancellation you will lose on a booking request for Rs. 2500. ",
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: VV_SMALL_PAD_VER),
                                          child: Text(
                                            "Note for your guest (optional)",
                                            style: TextStyle(
                                                fontSize: SMALL_FONT_SIZE),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color(0xff383838))),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              maxLength: 200,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText: null,
                                              ),
                                              minLines: 5,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  AppConstants().width * 0.102,
                                              right:
                                                  AppConstants().width * 0.025),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                side: BorderSide(
                                                    color: Colors.black),
                                                minimumSize: Size(
                                                    AppConstants().width *
                                                        0.256,
                                                    LARGE_PAD_VER),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                primary: Colors.white),
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: Text(
                                              "Reconsider",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.26,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                primary: Color(0xff272F3D)),
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: Text(
                                              "Decline",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            child: Text("Decline",
                                style: TextStyle(color: Colors.black))),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size(
                                  AppConstants().width * 0.256, LARGE_PAD_VER),
                              primary: Color(0xff272F3D) //model
                              ),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                title:
                                    SvgPicture.asset("assets/img/accept.svg"),
                                content: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(V_SMALL_PAD_HOR),
                                        child: Center(
                                          child: Text(
                                            "Yay! Congratulations",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "You have successfully accepted @Manya's booking request",
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: VV_SMALL_PAD_VER),
                                        child: Text(
                                          "Note for your guest (optional)",
                                          style: TextStyle(
                                              fontSize: SMALL_FONT_SIZE),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xff383838))),
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            maxLength: 200,
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: null,
                                            ),
                                            minLines: 5,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.26,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            primary: Colors.black),
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                        child: Text(
                                          "Done",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          child: Text("Accept")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
