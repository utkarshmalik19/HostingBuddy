import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../../models/inquiry_model.dart';
import 'drop_down-2.dart';
import 'package:card_swiper/card_swiper.dart';

class InquiryDetails extends StatefulWidget {
  const InquiryDetails(
      {Key? key, required this.list, required this.initalSelectedIndex})
      : super(key: key);
  final InquiryModels list;
  final int initalSelectedIndex;
  @override
  State<InquiryDetails> createState() => _InquiryDetailsState();
}

class _InquiryDetailsState extends State<InquiryDetails> {
  int selectedCard = 0;
  @override
  void initState() {
    selectedCard = widget.initalSelectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppConstants().height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: AppConstants().width * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: AppConstants().width * 0.05,
              ),
              Text(
                "Inquiries",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: V_LARGE_FONT_SIZE),
              )
            ],
          ),
          SizedBox(height: MEDIUM_PAD_2_VER),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
            child: DropDown2(),
          ),
          Expanded(
            child: Swiper(
              control: const SwiperControl(),
              itemCount: 4,
              loop: false,
              index: selectedCard,
              onIndexChanged: (selected) {
                setState(() {
                  selectedCard = selected;
                });
              },
              layout: SwiperLayout.TINDER,
              itemWidth: AppConstants().width,
              itemHeight: double.infinity,
              itemBuilder: (context, index) => Card(
                  color: Color(widget.list.bgColor[index]),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MEDIUM_PAD_2_VER,
                                  left: MEDIUM_PAD_2_HOR),
                              child: CircleAvatar(
                                  child: Image.asset(
                                      widget.list.img_url[index])), //model
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppConstants().height * 0.029,
                                  left: AppConstants().width * 0.025,
                                  right: AppConstants().width * 0.12),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: MED_FONT_SIZE,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppConstants().width * 0.197,
                                  top: AppConstants().height * 0.029),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: Color(0xff24BA0E))),
                                child: Padding(
                                  padding: EdgeInsets.all(V_SMALL_PAD_HOR / 2),
                                  child: Text(
                                    "₹${widget.list.amount[index]}",
                                    style: TextStyle(color: Color(0xff24BA0E)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: VV_SMALL_PAD_VER, left: LARGE_PAD_HOR),
                          child: Row(
                            children: [
                              Text("Thinnai    : "),
                              Text("By the way",
                                  style: TextStyle(
                                      color:
                                          Color(widget.list.textColor[index]))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: VV_SMALL_PAD_VER, left: LARGE_PAD_HOR),
                          child: Row(
                            children: [
                              Text("No. of guests : "),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AppConstants().width * 0.217),
                                child: Text(
                                  widget.list.noOfGuests[index].toString(),
                                  style: TextStyle(
                                      color:
                                          Color(widget.list.textColor[index])),
                                ), //model
                              ), //model

                              Text("Time : "),
                              Text(
                                widget.list.time[index],
                                style: TextStyle(
                                    color: Color(widget.list.textColor[index])),
                              ) //model
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: LARGE_PAD_HOR),
                          child: Row(
                            children: [
                              Text("Guest type      : "),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AppConstants().width * 0.135),
                                child: Text(
                                  widget.list.guestType[index],
                                  style: TextStyle(
                                      color:
                                          Color(widget.list.textColor[index])),
                                ),
                              ), //model
                              Text("Date : "),
                              Text(
                                widget.list.date[index],
                                style: TextStyle(
                                    color: Color(widget.list.textColor[index])),
                              ) //model
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MEDIUM_PAD_2_HOR),
                          child: Divider(
                            color: Color(0xffDFDAFF),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Services Requested",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: REGULAR_FONT_SIZE),
                              )),
                        ),
                        Container(
                          height: AppConstants().height * 0.059,
                          child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: chipList()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Guests id",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: REGULAR_FONT_SIZE))),
                        ),
                        Container(
                          height: AppConstants().height * 0.059,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(left: V_SMALL_PAD_HOR),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            color: Color(0xff8F7EF3))),
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: VV_SMALL_PAD_VER,
                                          left: AppConstants().width * 0.01,
                                          right: AppConstants().width * 0.01),
                                      child: Column(
                                        children: [
                                          Text(widget.list.guestName[index],
                                              style: TextStyle(
                                                  fontSize: DEFAULT_FONT_SIZE)),
                                          Text(
                                            "Id Type : ${widget.list.guestId[index]}",
                                            style: TextStyle(
                                                fontSize: SMALL_FONT_SIZE),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MEDIUM_PAD_2_HOR,
                                  right: AppConstants().width * 0.46),
                              child: Text(
                                "Ratings",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: DEFAULT_FONT_SIZE),
                              text: 'View Reviews',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Later");
                                },
                            ))
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MEDIUM_PAD_2_HOR,
                                top: V_SMALL_PAD_VER,
                                bottom: V_SMALL_PAD_VER),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MEDIUM_PAD_VER,
                              color: Color(0xff74EDB3),
                              child: Row(
                                children: [
                                  Container(
                                    width: MEDIUM_PAD_HOR,
                                    color: Color(0xffEED893),
                                  ),
                                  Container(
                                    width: MEDIUM_PAD_HOR,
                                    color: Color(0xffF4977E),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                              child: Text(
                                "Additional Note",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xffDFDAFF))),
                          child: TextFormField(
                            decoration:
                                InputDecoration.collapsed(hintText: null),
                            minLines:
                                4, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: V_SMALL_PAD_VER,
                              left: AppConstants().width * 0.012),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(90, 35),
                                      primary: Color(0xffDFDAFF) //model
                                      ),
                                  onPressed: () {},
                                  child: Text(
                                    "Reschedule",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppConstants().width * 0.03),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(color: Colors.black),
                                        minimumSize: Size(90, 35),
                                        primary: Color(0xffF3F1FF) //model
                                        ),
                                    onPressed: () {},
                                    child: Text("Decline",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(90, 35),
                                      primary: Color(0xff272F3D) //model
                                      ),
                                  onPressed: () {},
                                  child: Text("Accept")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  chipList() {
    return (BuildContext context, int index) =>
        _buildChip('Alcohol', "assets/alcohol.png");
  }

  Widget _buildChip(String label, String img) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 0, horizontal: AppConstants().width * 0.025),
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        labelPadding: EdgeInsets.all(V_SMALL_PAD_HOR / 4),
        avatar: Image.asset(img),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffEAE7FF),
        elevation: 1,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(V_SMALL_PAD_HOR),
      ),
    );
  }
}
