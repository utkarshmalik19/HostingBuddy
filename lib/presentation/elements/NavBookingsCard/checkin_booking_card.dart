import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/consts.dart';

class CheckInBookingCard extends StatefulWidget {
  int index;

  CheckInBookingCard({required this.index});

  @override
  State<CheckInBookingCard> createState() => _CheckInBookingCardState();
}

class _CheckInBookingCardState extends State<CheckInBookingCard> {
  @override
  Widget build(BuildContext context) {
    bool isCheckedin = false;
    String dropdownvalue = '1';
    String dropdownvalue2 = '00';
    String dropdownvalue3 = 'AM';
    var items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
    var items2 = [
      '00',
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '17',
      '18',
      '19',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
      '30',
      '31',
      '32',
      '33',
      '34',
      '35',
      '36',
      '37',
      '38',
      '39',
      '40',
      '41',
      '42',
      '43',
      '44',
      '45',
      '46',
      '47',
      '48',
      '49',
      '50',
      '51',
      '52',
      '53',
      '54',
      '55',
      '56',
      '57',
      '58',
      '59',
      '60'
    ];
    int number = 1;
    var items3 = ['AM', 'PM'];
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  SwipeCard(
        //       list: widget.list
        //   )),
        // );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants().width * 0.025),
          child: Card(
            color: BG_COLOR[widget.index], //model
            child: Padding(
              padding: EdgeInsets.only(left: SMALL_PAD_HOR),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MEDIUM_PAD_VER),
                    child: Row(
                      children: [
                        CircleAvatar(child: Image.asset("assets/img_1.png")),
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppConstants().width * 0.025,
                              right: AppConstants().width * 0.23),
                          //widget.list.name[index] showing error  '[]' was called on null
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: MED_FONT_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppConstants().width * 0.197),
                          child: Container(
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
                                  style: TextStyle(
                                      color: Color(0xff24BA0E),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: BUTTON_COLOR[widget.index],
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(
                              Icons.call,
                              color: TEXT_COLOR[widget.index],
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: VV_SMALL_PAD_VER),
                    child: Row(
                      children: [
                        Text(
                          "Thinnai  : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: AppConstants().width * 0.153),
                          child: Text(
                            "By The Way",
                            style: TextStyle(
                                color: TEXT_COLOR[widget.index],
                                fontSize: DEFAULT_FONT_SIZE),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: AppConstants().height * 0.009),
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
                                color: TEXT_COLOR[widget.index],
                                fontSize: DEFAULT_FONT_SIZE),
                          ), //model
                        ), //model

                        Text("Time : ",
                            style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Text(
                          "3.00-6.00 pm",
                          style: TextStyle(
                              color: TEXT_COLOR[widget.index],
                              fontSize: DEFAULT_FONT_SIZE),
                        ) //model
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Group type     : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Padding(
                        padding: EdgeInsets.only(right: LARGE_PAD_HOR),
                        child: Text(
                          "Family",
                          style: TextStyle(
                              color: TEXT_COLOR[widget.index],
                              fontSize: DEFAULT_FONT_SIZE),
                        ),
                      ), //model
                      Text("Date : ",
                          style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Text(
                        "30.06.22",
                        style: TextStyle(
                            color: TEXT_COLOR[widget.index],
                            fontSize: DEFAULT_FONT_SIZE),
                      ) //model
                    ],
                  ),
                  isCheckedin == false
                      ? Padding(
                          padding: EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(
                                          AppConstants().width * 0.256,
                                          LARGE_PAD_VER),
                                      primary:
                                          BUTTON_COLOR[widget.index] //model
                                      ),
                                  onPressed: () {},
                                  child: Text(
                                    "Report",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppConstants().width * 0.028),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(color: Colors.black),
                                        minimumSize: Size(
                                            AppConstants().width * 0.256,
                                            LARGE_PAD_VER),
                                        primary: BG_COLOR[widget.index] //model
                                        ),
                                    onPressed: () {},
                                    child: Text("No Show",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(
                                          AppConstants().width * 0.256,
                                          LARGE_PAD_VER),
                                      primary: Color(0xff272F3D) //model
                                      ),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Center(child: Text("Check-in")),
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: LARGE_PAD_HOR),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "What time did your guest checked-in?"),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: SMALL_PAD_VER),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      DropdownButton(
                                                        onChanged: (value) {},
                                                        menuMaxHeight:
                                                            AppConstants()
                                                                    .height *
                                                                0.237,
                                                        value: dropdownvalue,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff6053AE)),
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down),
                                                        items: items.map(
                                                            (String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        }).toList(),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: SMALL_PAD_VER,
                                                            right:
                                                                AppConstants()
                                                                        .width *
                                                                    0.0128,
                                                            left: AppConstants()
                                                                    .width *
                                                                0.0128),
                                                        child: Text(" : "),
                                                      ),
                                                      DropdownButton(
                                                        onChanged: (value) {},
                                                        menuMaxHeight:
                                                            AppConstants()
                                                                    .height *
                                                                0.237,
                                                        value: dropdownvalue2,
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down),
                                                        items: items2.map(
                                                            (String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        }).toList(),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: AppConstants()
                                                                    .width *
                                                                0.0128),
                                                        child: DropdownButton(
                                                          onChanged: (value) {},
                                                          value: dropdownvalue3,
                                                          items: items3.map(
                                                              (String items) {
                                                            return DropdownMenuItem(
                                                              value: items,
                                                              child:
                                                                  Text(items),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: SizedBox(
                                              width:
                                                  AppConstants().width * 0.384,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.black),
                                                onPressed: () {
                                                  // Buttons not changing
                                                  setState(() {
                                                    isCheckedin = true;
                                                  });
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                  //Dialog to be shown on clicking continue
                                                  // showDialog<String>(
                                                  //   context: context,
                                                  //   builder: (BuildContext context) => AlertDialog(
                                                  //     shape: RoundedRectangleBorder(
                                                  //         borderRadius: BorderRadius.circular(20)),
                                                  //     title:
                                                  //     SvgPicture.asset("assets/img/accept.svg"),
                                                  //     content: Container(
                                                  //       height:
                                                  //       MediaQuery.of(context).size.height * 0.30,
                                                  //       child: Column(
                                                  //         mainAxisAlignment: MainAxisAlignment.start,
                                                  //         crossAxisAlignment:
                                                  //         CrossAxisAlignment.start,
                                                  //         children: [
                                                  //           Padding(
                                                  //             padding:  EdgeInsets.all(V_SMALL_PAD_HOR),
                                                  //             child: Center(
                                                  //               child: Text(
                                                  //                 "Checked In Successful",
                                                  //                 style: TextStyle(
                                                  //                     fontWeight: FontWeight.bold),
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //           Text(
                                                  //             "Your Guests checked on time!",
                                                  //             style: TextStyle(color: Colors.black),
                                                  //             textAlign: TextAlign.center,
                                                  //           ),
                                                  //           Padding(
                                                  //             padding:  EdgeInsets.symmetric(
                                                  //                 vertical: VV_SMALL_PAD_VER),
                                                  //             child: Text(
                                                  //               "Check out Time : 6:00 PM",
                                                  //               style: TextStyle(fontSize: SMALL_FONT_SIZE),
                                                  //             ),
                                                  //           ),
                                                  // Padding(
                                                  // padding:  EdgeInsets.symmetric(
                                                  // vertical: V_SMALL_PAD_VER),
                                                  // child: Text(
                                                  // "Happy Hosting!",
                                                  // style: TextStyle(fontSize: REGULAR_FONT_SIZE,color : Color(0xffE08600)),
                                                  // ),
                                                  // ),
                                                  //
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //
                                                  //   ),
                                                  // );
                                                  //End of Dialog Box
                                                },
                                                child: Text(
                                                  "Continue",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text("Check-in")),
                            ],
                          ),
                        )
                      : Container(),
                  isCheckedin == true
                      ? Padding(
                          padding: EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppConstants().width * 0.3,
                                    right: AppConstants().width * 0.028),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(color: Colors.black),
                                        minimumSize: Size(
                                            AppConstants().width * 0.256,
                                            LARGE_PAD_VER),
                                        primary: BG_COLOR[widget.index] //model
                                        ),
                                    onPressed: () {},
                                    child: Text("Report",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(
                                          AppConstants().width * 0.256,
                                          LARGE_PAD_VER),
                                      primary: Color(0xff272F3D) //model
                                      ),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            Center(child: Text("Edit Booking")),
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: LARGE_PAD_HOR),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Add Guests"),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: VV_SMALL_PAD_VER,
                                                      bottom: SMALL_PAD_VER),
                                                  child: Container(
                                                    width:
                                                        AppConstants().width *
                                                            0.2,
                                                    color: Color(0xffF3F1FF),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                number--;
                                                              });
                                                            },
                                                            child: Icon(
                                                                Icons.remove)),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      VV_SMALL_PAD_VER),
                                                          child: Text(number
                                                              .toString()),
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                number++;
                                                              });
                                                            },
                                                            child:
                                                                Icon(Icons.add))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Extend Check-Out Time",
                                                  style: TextStyle(
                                                      fontSize: MED_FONT_SIZE),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: VV_SMALL_PAD_VER,
                                                      bottom: SMALL_PAD_VER),
                                                  child: Container(
                                                    width:
                                                        AppConstants().width *
                                                            0.2,
                                                    color: Color(0xffEEFCEC),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: (){
                                                              setState(() {
                                                                number--;
                                                              });
                                                            },
                                                            child: Icon(Icons.remove)),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      VV_SMALL_PAD_VER),
                                                          child: Text(number
                                                              .toString()),
                                                        ),
                                                        Icon(Icons.add)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text("Add permits"),
                                                chipList()
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: SizedBox(
                                              width:
                                                  AppConstants().width * 0.384,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.black),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                },
                                                child: Text(
                                                  "Apply Changes",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text("Edit Booking")),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

chipList() {
  bool isSelected = false;
  return Wrap(
    spacing: 6.0,
    runSpacing: 1.0,
    children: <Widget>[
      _buildChip('Apartment', true),
      _buildChip('Individual space', false),
      _buildChip('Balcony', false),
      _buildChip('Balcony', true),
      _buildChip('Balcony', false),
      _buildChip('Balcony', true),
    ],
  );
}

Widget _buildChip(String label, bool isSelected) {
  return Chip(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    labelPadding: EdgeInsets.all(AppConstants().width * 0.005),
    label: Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    backgroundColor: Color(0xffE7F0F4),
    elevation: 0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(AppConstants().width * 0.02),
  );
}
