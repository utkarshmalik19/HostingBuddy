import 'package:flutter/material.dart';

import '../../../utils/consts.dart';
import '../RescheduleDialog.dart';

class ConfirmedBookingsCard extends StatelessWidget {
  int index;
  ConfirmedBookingsCard({required this.index});

  @override
  Widget build(BuildContext context) {
    int txtColor = 0xff2F8C21;
    return Padding(
      padding:  EdgeInsets.only(top: AppConstants().height*0.021,left: AppConstants().width*0.025, right: AppConstants().width*0.025),
      child: Container(
          color: BG_COLOR[index],
          height: MediaQuery.of(context).size.height * 0.30,
          child: Padding(
            padding:  EdgeInsets.only(left: AppConstants().width*0.046),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: AppConstants().height*0.029),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                          ),
                          child: CircleAvatar(
                              child: Image.asset("assets/img_1.png")
                              ), //model
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                               left: AppConstants().width*0.025, right: AppConstants().width*0.23),
                          //widget.list.name[index] showing error  '[]' was called on null
                          child: Text(
                            "Name",
                            style: TextStyle(
                                fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: AppConstants().width*0.184,right: AppConstants().width*0.01),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Color(0xff24BA0E))),
                            child: Padding(
                              padding:  EdgeInsets.all(AppConstants().width*0.01),
                              child: Center(
                                child: Text(
                                  "₹500",
                                  style: TextStyle(color: Color(0xff24BA0E)),
                                ),
                              ),
                            ),
                          ),

                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: BUTTON_COLOR[index],
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Icon(Icons.call,color: TEXT_COLOR[index],))
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: VV_SMALL_PAD_VER),
                    child: Row(
                      children: [
                        Text("Thinnai  : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Padding(
                          padding:  EdgeInsets.only(right: AppConstants().width*0.153),
                          child: Text(
                            "The Way Thinnai",
                            style: TextStyle(
                                color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: AppConstants().height*0.009),
                    child: Row(
                      children: [
                        Text("No. of guests : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Padding(
                          padding:  EdgeInsets.only(right: AppConstants().width*0.15),
                          child: Text(
                            "6",
                            style: TextStyle(
                                color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                          ), //model
                        ), //model

                        Text("Time : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Text(
                          "3.00-6.00 pm",
                          style: TextStyle(
                              color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                        ) //model
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Group type    : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Padding(
                        padding:  EdgeInsets.only(right: LARGE_PAD_HOR),
                        child: Text(
                          "Family",
                          style: TextStyle(
                              color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                        ),
                      ), //model
                      Text("Date : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                      Text(
                        "30.06.22",
                        style:
                            TextStyle(color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER, left: AppConstants().width*0.256),
                    child: Row(
                      children: [
                        RescheduleButton(index: index,),
                        Padding(
                          padding:
                               EdgeInsets.symmetric(horizontal: AppConstants().width*0.028),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  side: BorderSide(color: Colors.black),
                                  minimumSize: Size(AppConstants().width*0.256, LARGE_PAD_VER),
                                  primary: BG_COLOR[index]
                                  ),
                              onPressed: () {},
                              child: Text("Cancel",
                                  style: TextStyle(color: Colors.black))),
                        ),
                      ],
                    ),
                  )
                ]),
          )),
    );

    //   Padding(
    //   padding: const EdgeInsets.only(left: 17,right: 17,top: 17),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Color(0xffF2F0DF)
    //     ),
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(right: 10, top: 23,bottom: 10),
    //               child: CircleAvatar(),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(right: 100,top: 28),
    //               child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
    //             ),
    //             Container(
    //               decoration: BoxDecoration(
    //                   border: Border.all(color: Colors.green)
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.only(right: 10),
    //                 child: Text("500"),
    //               ),
    //             ),
    //             Icon(Icons.phone)
    //
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Text("Thinnai    : "),
    //             Text("Breezy Cove",style: TextStyle(color: Color(0xffE08600))),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Text("No. of guests : "),
    //             Text("6",style: TextStyle(color: Color(0xffE08600))),
    //             SizedBox(width: 50,),
    //             Text("Time : "),
    //             Text("3-6 pm",style: TextStyle(color: Color(0xffE08600))),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Text("Group Type : "),
    //             Text("Family",style: TextStyle(color: Color(0xffE08600))),
    //             SizedBox(width:25,),
    //             Text("Date : "),
    //             Text("30.6.22",style: TextStyle(color: Color(0xffE08600))),
    //           ],
    //         ),
    //
    //         Row(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(left: 118,right: 10),
    //               child: ElevatedButton(onPressed: (){},
    //                   child: Text("Reschedule")),
    //             ),
    //             ElevatedButton(onPressed: (){},
    //                 child: Text("Cancel"))
    //           ],
    //         )
    //
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
