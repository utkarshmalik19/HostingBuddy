import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaffold/utils/consts.dart';

import 'layouts/CustomScaffold.dart';

class IssuesPage extends StatelessWidget {
  const IssuesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: LARGE_PAD_HOR),
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
                        child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                    Text(
                      "Help & Support",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: V_LARGE_FONT_SIZE),
                    ),
                  ],
                ),
              ),
              Container(
                  color: Color(0xffF3F1FF),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: V_SMALL_PAD_VER,
                        left: MEDIUM_PAD_2_HOR,
                        right: AppConstants().width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "ONGOING ISSUE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: V_SMALL_PAD_HOR,
                                  left: AppConstants().width * 0.18),
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                    color: Color(0xffE08600),
                                    fontSize: SMALL_FONT_SIZE),
                              ),
                            ),
                            SizedBox(
                                width: LARGE_PAD_HOR,
                                height: MEDIUM_PAD_2_VER,
                                child:
                                    SvgPicture.asset("assets/img/decline.svg"))
                          ],
                        ),
                        Divider(
                          color: Color(0xffDCD6FF),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: VV_SMALL_PAD_VER),
                          child: Row(
                            children: [
                              Text(
                                "Reported On :",
                                style: TextStyle(
                                    fontSize: DEFAULT_FONT_SIZE,
                                    color: Color(0xff747474)),
                              ),
                              Text("12th Jul 2022",
                                  style: TextStyle(
                                      color: Color(0xff656565),
                                      fontSize: DEFAULT_FONT_SIZE,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text("Issue related to: ",
                                style: TextStyle(
                                    fontSize: DEFAULT_FONT_SIZE,
                                    color: Color(0xff747474))),
                            Text("Booking cancellation",
                                style: TextStyle(
                                    color: Color(0xff656565),
                                    fontSize: DEFAULT_FONT_SIZE,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppConstants().width * 0.41),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Color(0xffDFDAFF)),
                                  elevation: 0,
                                  primary: Color(0xffF3F1FF)),
                              child: Text(
                                "View Details",
                                style: TextStyle(color: Color(0xff8F7EF3)),
                              )),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: V_LARGE_PAD_VER),
                child: Container(
                  color: Color(0xffF8F8F8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "PREVIOUS ISSUES",
                        style: TextStyle(
                            color: Color(0xff656565),
                            fontSize: REGULAR_FONT_SIZE,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: SMALL_PAD_VER),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffDFDAFF))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: V_SMALL_PAD_VER, left: MEDIUM_PAD_2_HOR),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Booking cancellation",
                                      style: TextStyle(
                                          color: Color(0xff656565),
                                          fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: V_SMALL_PAD_HOR,
                                          left: AppConstants().width*0.189),
                                      child: Text(
                                        "Completed",
                                        style: TextStyle(
                                            color: Color(0xff24BA0E),
                                            fontSize: V_SMALL_PAD_VER),
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
                                          fontSize: DEFAULT_FONT_SIZE,
                                          color: Color(0xff747474)),
                                    ),
                                    Text("12th Jul 2022",
                                        style: TextStyle(
                                            color: Color(0xff656565),
                                            fontSize: DEFAULT_FONT_SIZE,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: VV_SMALL_PAD_VER),
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
                                  padding: EdgeInsets.only(
                                      left: AppConstants().width * 0.41),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(
                                              color: Color(0xffDFDAFF)),
                                          elevation: 0,
                                          primary: Color(0xffF8F8F8)),
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(
                                            color: Color(0xff8F7EF3)),
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
      ),
    );
  }
}
