import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scaffold/utils/consts.dart';

import 'layouts/CustomScaffold.dart';

class PreviousIssues extends StatelessWidget {
  const PreviousIssues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: V_LARGE_PAD_VER,left: V_LARGE_PAD_HOR),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  Text(
                    "Help & Support",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: V_LARGE_FONT_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: V_LARGE_PAD_VER),
              child: Container(
                height: AppConstants().height*0.059,
                color: Color(0xffF8F8F8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                      child: Text(
                        "PREVIOUS ISSUES",
                        style: TextStyle(
                            color: Color(0xff656565),
                            fontSize: REGULAR_FONT_SIZE,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                         EdgeInsets.only(top: SMALL_PAD_VER, left: LARGE_PAD_HOR, right: LARGE_PAD_HOR),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffDFDAFF))),
                        child: Padding(
                          padding:  EdgeInsets.only(top: V_SMALL_PAD_VER, left: MEDIUM_PAD_2_HOR),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Booking cancellation",
                                    style: TextStyle(
                                        color: Color(0xff656565),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        right: V_SMALL_PAD_HOR, left: AppConstants().width*0.179),
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                          color: Color(0xff24BA0E),
                                          fontSize: SMALL_FONT_SIZE),
                                    ),
                                  ),
                                  SizedBox(
                                      width: LARGE_PAD_HOR,
                                      height: MEDIUM_PAD_VER,
                                      child: SvgPicture.asset(
                                          "assets/img/accept.svg"))
                                ],
                              ),
                              Divider(
                                color: Color(0xffDCD6FF),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reported On :",
                                    style: TextStyle(
                                        fontSize: DEFAULT_FONT_SIZE, color: Color(0xff747474)),
                                  ),
                                  Text("12th Jul 2022",
                                      style: TextStyle(
                                          color: Color(0xff656565),
                                          fontSize: DEFAULT_FONT_SIZE,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: VV_SMALL_PAD_VER),
                                child: Row(
                                  children: [
                                    Text("Resolved On  : ",
                                        style: TextStyle(
                                            fontSize: DEFAULT_FONT_SIZE,
                                            color: Color(0xff747474))),
                                    Text("23rd Jul 2022",
                                        style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: DEFAULT_FONT_SIZE,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: AppConstants().width*0.41),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color(0xffDFDAFF)),
                                        elevation: 0,
                                        primary: Color(0xffF8F8F8)),
                                    child: Text(
                                      "View Details",
                                      style:
                                          TextStyle(color: Color(0xff8F7EF3)),
                                    )),
                              )
                            ],
                          ),
                        )),
                  );
                })
          ],
        ),
      ),
    );
  }
}
