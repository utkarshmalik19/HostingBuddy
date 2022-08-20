import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/consts.dart';
import '../elements/DougnutChart2.dart';
import '../elements/dougnut_chart.dart';

class HostJourney extends StatelessWidget {
  const HostJourney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = ['Thinnai Details', 'My Details', 'Account Details'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: SMALL_PAD_HOR),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: V_LARGE_PAD_VER, bottom: SMALL_PAD_VER),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.black)),
                      Text(
                        "Host Journey",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: V_LARGE_FONT_SIZE),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: SMALL_PAD_HOR),
                  child: Text(
                      "Hey Arvanith, Congratulation on taking first step for your thinnai   hosting journey!"),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {

                      bool isStarted = true;
                      bool isCompleted = false;
                      return Padding(
                        padding: EdgeInsets.only(
                            right: SMALL_PAD_HOR,
                            top: VV_SMALL_PAD_VER,
                            bottom: VV_SMALL_PAD_VER),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: BG_COLOR[index],
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SMALL_PAD_HOR,
                                top: SMALL_PAD_HOR,
                                bottom: SMALL_PAD_HOR),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontSize: MED_FONT_SIZE,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: AppConstants().width * 0.52,
                                      child: Text(
                                          "Please click the button below to start adding details of your unique dining space"),
                                    ),
                                    isStarted == true
                                    ?Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(left: 50,top: LARGE_PAD_VER),
                                              child: Text("50%",style: TextStyle(color: TEXT_COLOR[index],fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold),),
                                            ),
                                            DougnutChart2(
                                                index: index, color: BUTTON_COLOR[index], progress: 60,
                                                ),
                                          ],
                                        ) ,
                                        Padding(
                                          padding:  EdgeInsets.only(top: V_SMALL_PAD_VER),
                                          child: Text(
                                            "Completed",
                                            style: TextStyle(
                                                color: Color(0xff228514),
                                                fontSize: SMALL_FONT_SIZE),
                                          ),
                                        )
                                      ],
                                    ) : Container(),
                                    isCompleted == true
                                    ? Padding(
                                      padding:  EdgeInsets.only(left: AppConstants().width*0.15),
                                      child: Column(
                                        children: [
                                          SvgPicture.asset("assets/img/accept.svg") ,
                                          Padding(
                                            padding:  EdgeInsets.only(top: V_SMALL_PAD_VER),
                                            child: Text(
                                              "Approved",
                                              style: TextStyle(
                                                  color: Color(0xff228514),
                                                  fontSize: SMALL_FONT_SIZE),
                                            ),
                                          )
                                        ],
                                      ),
                                    ) : Container()
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: BUTTON_COLOR[index]),
                                    child: Text(
                                      "Add Details",
                                      style: TextStyle(color: Colors.black),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Row(
                  children: [
                    SizedBox(
                      width: AppConstants().width * 0.42,
                      height: V_LARGE_PAD_VER,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Request a call",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SMALL_PAD_HOR),
                      child: SizedBox(
                        width: AppConstants().width * 0.42,
                        height: V_LARGE_PAD_VER,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text("Chat Now")),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
