import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../../../models/review_card_data.dart';
import '../../../models/reviews_model.dart';
import '../../elements/dougnut_chart.dart';

class ReviewTb extends StatefulWidget {
  //const ReviewTb({Key? key}) : super(key: key);

  ReviewModel list;
  ReviewTb({required this.list});
  //ReviewTb({ required this.positive, required this.negative, required this.color, required this.rating, required this.totalReviews});
  @override
  State<ReviewTb> createState() => _ReviewTbState();
}

class _ReviewTbState extends State<ReviewTb> {
  int positive = ReviewCardData.column_list[0].positive;
  int negative = ReviewCardData.column_list[0].negative;
  int color = ReviewCardData.column_list[0].poscolor;
  int color2 = ReviewCardData.column_list[0].bgcolor;
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    var _switchValue = true;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2,
                child: Card(
                  color: Color(0xffF3F1FF),
                  semanticContainer: true,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color(0xff8F7EF3),
                          width: AppConstants().height * 0.003)),
                  borderOnForeground: true,
                  margin: EdgeInsets.all(MEDIUM_PAD_2_HOR),

                  // decoration: BoxDecoration( color: Colors.blue,border: Border.all(color: Colors.blueAccent) ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Space Reviews",
                          style: TextStyle(
                              color: Color(0xff8F7EF3),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      Text("100"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2,
                child: Card(
                  color: Color(0xffF2F0DF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color(0xffF4AD43),
                          width: AppConstants().height * 0.003)),
                  margin: EdgeInsets.all(MEDIUM_PAD_2_HOR),

                  //decoration: BoxDecoration( color:Colors.blue,border: Border.all(color: Colors.blueAccent) ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Host Reviews",
                        style: TextStyle(
                            color: Color(0xffF39D1B),
                            fontWeight: FontWeight.bold),
                      ),
                      Text("200"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: LARGE_PAD_HOR),
            child: Text(
              "For Space",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MED_FONT_SIZE_2),
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                positive = ReviewCardData.column_list[index].positive;
                negative = ReviewCardData.column_list[index].negative;
                color = ReviewCardData.column_list[index].bgcolor;
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants().width * 0.05,
                      vertical: VV_SMALL_PAD_VER),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(ReviewCardData.column_list[index].bgcolor),
                    child: Padding(
                      padding: EdgeInsets.all(SMALL_PAD_HOR),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ReviewCardData.column_list[index].title.toString(),
                            style: TextStyle(
                                fontSize: MED_FONT_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: VV_SMALL_PAD_VER,
                                left: AppConstants().width * 0.03),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.mood, color: Color(0xff39A772)),
                                    Text("68"),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: V_LARGE_PAD_HOR),
                                  child: Column(
                                    children: [
                                      Icon(Icons.sentiment_satisfied,
                                          color: Color(0xffC6AA53)),
                                      Text("12"),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.mood_bad,
                                        color: Color(0xffC1583C)),
                                    Text("12"),
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                                  child: DougnutChart(
                                      index: index,
                                      happy: positive,
                                      neutral: negative,
                                  sad: negative),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          ListView.builder(
              // Listview disappears when horizontal axis
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MEDIUM_PAD_2_VER,
                      left: V_SMALL_PAD_VER,
                      right: AppConstants().width * 0.025),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F1FF),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/img_1.png"),
                      ),
                      title: Row(
                        children: [
                          Text("Name"),
                          SizedBox(width: AppConstants().width * 0.38),
                          CupertinoSwitch(
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          )
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                              " quis nostrud exercitation gajw jwjop."),
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppConstants().height * 0.009),
                            child: Text(
                              "23.06.2020 12:90",
                              style: TextStyle(fontSize: SMALL_FONT_SIZE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Padding(
            padding: EdgeInsets.only(left: LARGE_PAD_HOR),
            child: Text(
              "For Space",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MED_FONT_SIZE_2),
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                positive = ReviewCardData.column_list[index].positive;
                negative = ReviewCardData.column_list[index].negative;
                color = ReviewCardData.column_list[index].bgcolor;
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants().width * 0.05,
                      vertical: VV_SMALL_PAD_VER),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(ReviewCardData.column_list[index].bgcolor),
                    child: Padding(
                      padding: EdgeInsets.all(SMALL_PAD_HOR),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ReviewCardData.column_list[index].title.toString(),
                            style: TextStyle(
                                fontSize: MED_FONT_SIZE,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: VV_SMALL_PAD_VER,
                                left: AppConstants().width * 0.03),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.mood, color: Color(0xff39A772)),
                                    Text("68"),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: V_LARGE_PAD_HOR),
                                  child: Column(
                                    children: [
                                      Icon(Icons.sentiment_satisfied,
                                          color: Color(0xffC6AA53)),
                                      Text("12"),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.mood_bad,
                                        color: Color(0xffC1583C)),
                                    Text("12"),
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                                  child: DougnutChart(
                                      index: index,
                                      happy: positive,
                                      neutral: negative,
                                      sad: negative),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          ListView.builder(
            // Listview disappears when horizontal axis
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MEDIUM_PAD_2_VER,
                      left: V_SMALL_PAD_VER,
                      right: AppConstants().width * 0.025),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3F1FF),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/img_1.png"),
                      ),
                      title: Row(
                        children: [
                          Text("Name"),
                          SizedBox(width: AppConstants().width * 0.38),
                          CupertinoSwitch(
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                          )
                        ],
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                                  " quis nostrud exercitation gajw jwjop."),
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppConstants().height * 0.009),
                            child: Text(
                              "23.06.2020 12:90",
                              style: TextStyle(fontSize: SMALL_FONT_SIZE),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
