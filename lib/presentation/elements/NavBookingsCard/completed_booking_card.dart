import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

class CompletedBookingsCard extends StatelessWidget {
  int index;
  CompletedBookingsCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: AppConstants().width*0.025, right: AppConstants().width*0.025,top: V_SMALL_PAD_VER),
      child: Container(
          color: BG_COLOR[index],
          height: MediaQuery.of(context).size.height * 0.25,
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


                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: VV_SMALL_PAD_VER),
                    child: Row(
                      children: [
                        Text("Thinnai  : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Text(
                          "By The Way",
                          style: TextStyle(
                              color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: AppConstants().height*0.0095),
                    child: Row(
                      children: [
                        Text("Booking Date : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Padding(
                          padding:  EdgeInsets.only(right: LARGE_PAD_HOR),
                          child: Text(
                            "30.06.22",
                            style: TextStyle(
                                color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                          ), //model
                        ), //model

                        Text("Checkout Time : ",style: TextStyle(fontSize: REGULAR_FONT_SIZE)),
                        Text(
                          "6.00 pm",
                          style: TextStyle(
                              color: TEXT_COLOR[index], fontSize: DEFAULT_FONT_SIZE),
                        ) //model
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER, left: AppConstants().width*0.569),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size(AppConstants().width*0.256, LARGE_PAD_VER),
                            primary: BUTTON_COLOR[index] //model
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Guest Review"),
                              content: Container(

                                height: MediaQuery.of(context).size.height*0.55,
                                child: Column(
                                  children: [

                                      Image.asset("assets/img_1.png"),
                                   Text("Guest Name"),
                                    Text("Rate your Hosting experience",style: TextStyle(color: Color(0xff50555C),fontSize: 14),),
                                    Padding(
                                      padding:  EdgeInsets.only(top: SMALL_PAD_VER,bottom: SMALL_PAD_VER),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                                            child: Image.asset("assets/img/good.png"),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.05),
                                            child: Image.asset("assets/img/average.png"),
                                          ),
                                          Image.asset("assets/img/bad.png")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(

                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(width: 1, color: Color(0xff383838))),
                                        child: TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration.collapsed(hintText: null,),
                                          minLines: 5,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: Text(
                                      "Submit Review",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      elevation: 0
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancel');
                                    },
                                    child: Text(
                                      "Maybe Later",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "Add Review",
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                ]),
          )),
    );
  }
}