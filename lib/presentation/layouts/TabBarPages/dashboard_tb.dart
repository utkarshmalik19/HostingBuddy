import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold/utils/consts.dart';

import '../../../models/data/graph_box_data.dart';
import '../../../models/data/graph_data_1.dart';
import '../../../models/data/graph_data_2.dart';
import '../../elements/age_range.dart';
import '../BookingsDashboardPage.dart';
import '../RevenuePage.dart';
import '../ReviewPage.dart';

class DashBoardTb extends StatefulWidget {
  //const DashBoardTb({Key? key}) : super(key: key);
  final List<int> reviews;
  final List<int> reviewsExtra;
  final int revenueGenerated;
  final int revenueLost;
  final List<int> color;
  final List<double> qty;
  final List<int> val;
  final List<String> title;
  DashBoardTb(
      {required this.reviews,
      required this.reviewsExtra,
      required this.revenueGenerated,
      required this.revenueLost,
      required this.color,
      required this.qty,
      required this.val,
      required this.title});
  @override
  State<DashBoardTb> createState() => _DashBoardTbState();
}

class _DashBoardTbState extends State<DashBoardTb> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(AppConstants().width * 0.025),
            child: Container(
              height: AppConstants().height * 0.21,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.only(
                      top: V_SMALL_PAD_VER,
                      bottom: V_SMALL_PAD_VER,
                      left: SMALL_PAD_HOR),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppConstants().width * 0.03,
                              top: V_SMALL_PAD_HOR),
                          child: Text(widget.title[index]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConstants().width * 0.03),
                              child: Container(
                                  height: MEDIUM_PAD_2_VER,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: AgeRange(
                                    color: widget.color[index],
                                    value:
                                        AgeRangeData.age_range_list[index].qty,
                                  )),
                            ),
                            Text("${widget.val[index]}%")
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.19,
            child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    // padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                    padding: EdgeInsets.only(
                        top: SMALL_PAD_VER,
                        left: LARGE_PAD_HOR,
                        right: AppConstants().width * 0.03),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.of(context).pushNamed('/reviewPage');
                          }
                          if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookingDashBoardPage()),
                            );
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(GraphBoxData
                                            .graph_box_list[index].borderColor)
                                        .withOpacity(0.025),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                    width: AppConstants().height * 0.001,
                                    color: Color(GraphBoxData
                                        .graph_box_list[index].borderColor)),
                                borderRadius: BorderRadius.circular(10)),
                            height: MediaQuery.of(context).size.height * .175,
                            width: MediaQuery.of(context).size.width * .38,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: V_SMALL_PAD_HOR,
                                        top: VV_SMALL_PAD_VER),
                                    child: Text(
                                      GraphBoxData.graph_box_list[index].title,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MED_FONT_SIZE)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: V_SMALL_PAD_HOR,
                                        top: VV_SMALL_PAD_VER),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(widget.reviews[index].toString(),
                                            style: TextStyle(
                                                fontSize: MED_FONT_SIZE_2,
                                                color: Color(0xff8F7EF3))),
                                        Text("+${widget.reviewsExtra[index]}",
                                            style: TextStyle(
                                                fontSize: DEFAULT_FONT_SIZE)),
                                      ],
                                    ),
                                  ),
                                  GraphData1(
                                    color: GraphBoxData
                                        .graph_box_list[index].color,
                                    color1: GraphBoxData
                                        .graph_box_list[index].gColor1,
                                    color2: GraphBoxData
                                        .graph_box_list[index].gColor2,
                                    color3: GraphBoxData
                                        .graph_box_list[index].gColor3,
                                    color4: GraphBoxData
                                        .graph_box_list[index].gColor4,
                                  ),
                                ])),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: LARGE_PAD_HOR, top: AppConstants().height * 0.009),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RevenuePage()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff3DA2BE).withOpacity(0.01),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Color(0xff3DA2BE)),
                        // color: Color(0xffF4AD43),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height * .23,
                    width: MediaQuery.of(context).size.height * .40,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: SMALL_PAD_VER, left: SMALL_PAD_HOR),
                            child: Text(
                              "Revenue",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MED_FONT_SIZE)),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: V_SMALL_PAD_VER, left: SMALL_PAD_HOR),
                                child: Text(
                                  "Revenue generated",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: DEFAULT_FONT_SIZE,
                                        color: Color(0xff747474)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppConstants().width * 0.118,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: V_SMALL_PAD_VER),
                                child: Text(
                                  "Revenue Lost",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: DEFAULT_FONT_SIZE,
                                        color: Color(0xff747474)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: V_SMALL_PAD_VER, left: SMALL_PAD_HOR),
                            child: Row(
                              children: [
                                Text(
                                  "₹20,000",
                                  style: TextStyle(color: Color(0xff8DCD7E)),
                                ),
                                SizedBox(
                                  width: AppConstants().width * 0.3,
                                ),
                                Text(
                                  "₹7000",
                                  style: TextStyle(color: Color(0xff118CB1)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: GraphData2(),
                            ),
                          ),
                        ])),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AgeRangeData {
  static List<AgeRangeModel> age_range_list = [
    AgeRangeModel("Availability", 0xff9D92E2, 0.5, "50%"),
    AgeRangeModel("Acceptance Rate", 0xff6EC4EB, 0.6, "60%"),
    AgeRangeModel("Response Rate", 0xffF6C477, 0.7, "70%"),
  ];
}

class AgeRangeModel {
  final String text;
  final int color;
  final double qty;
  final String val;

  AgeRangeModel(this.text, this.color, this.qty, this.val);
}
