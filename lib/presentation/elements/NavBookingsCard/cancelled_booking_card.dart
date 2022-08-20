import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/NavBookingsCard/cancelled_booking_page.dart';
import 'package:scaffold/utils/consts.dart';

class CancelledBookingsCard extends StatelessWidget {
  int index;
  CancelledBookingsCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: AppConstants().width*0.025, right: AppConstants().width*0.025, top: V_SMALL_PAD_VER),
      child: Container(
          color: BG_COLOR[index],
          height: MediaQuery.of(context).size.height * 0.20,
          child: Padding(
            padding:  EdgeInsets.only(left: SMALL_PAD_HOR),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.03),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: CircleAvatar(
                          child: Image.asset("assets/img_1.png")), //model
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: AppConstants().width*0.025, right: AppConstants().width*0.23),
                      //widget.list.name[index] showing error  '[]' was called on null
                      child: Text(
                        "name",
                        style: TextStyle(
                            fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: AppConstants().width*0.1974),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xff24BA0E))),
                        child: Padding(
                          padding:  EdgeInsets.all(AppConstants().width*0.01),
                          child: Center(
                            child: Text(
                              "₹2500",
                              style: TextStyle(color: Color(0xff24BA0E),fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.009),
                child: Row(
                  children: [
                    Text("No. of guests : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Padding(
                      padding:  EdgeInsets.only(right: AppConstants().width*0.153),
                      child: Text(
                        "6",
                        style:
                            TextStyle(color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                      ), //model
                    ), //model

                    Text("Time : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                    Text(
                      "3.00-6.00 pm",
                      style: TextStyle(color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
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
                      style: TextStyle(color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                    ),
                  ), //model
                  Text("Date : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                  Text(
                    "30.06.22",
                    style: TextStyle(color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                  )
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppConstants().width*0.038,top: V_SMALL_PAD_VER),
                child: Text("Cancelled on 24.06.22",style: TextStyle(fontSize: DEFAULT_FONT_SIZE),),
              )
            ]),
          )),
    );
  }
}
