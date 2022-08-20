import 'package:flutter/material.dart';
import 'package:scaffold/models/router_arguments.dart';

import '../../../models/inquiry_model.dart';
import '../../../utils/consts.dart';
import '../../elements/RescheduleDialog.dart';

class InquiryTb extends StatefulWidget {
  //const InquiryTb({Key? key}) : super(key: key);
  final InquiryModels list;
  final selectedIndex;
  InquiryTb({required this.list, @required this.selectedIndex});
  @override
  State<InquiryTb> createState() => _InquiryTbState();
}

class _InquiryTbState extends State<InquiryTb> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/details',
                  arguments: InquiryDetailArguments(
                      list: widget.list, initalSelectedIndex: index));
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SMALL_PAD_HOR),
                child: Card(
                  color: BG_COLOR[index % 4], //model
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppConstants().width * 0.046),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: SMALL_PAD_VER,
                              ),
                              child: CircleAvatar(
                                  child: Image.asset(
                                      widget.list.img_url[index])), //model
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppConstants().height * 0.029,
                                  left: AppConstants().width * 0.025,
                                  right: AppConstants().width * 0.23),
                              //widget.list.name[index] showing error  '[]' was called on null
                              child: Text(
                                "name",
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
                                  padding: EdgeInsets.all(
                                      AppConstants().width * 0.01),
                                  child: Center(
                                      child: Text(
                                    "₹${widget.list.amount[index]}",
                                    style: TextStyle(
                                        color: Color(0xff24BA0E),
                                        fontSize: REGULAR_FONT_SIZE),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppConstants().height * 0.009),
                          child: Row(
                            children: [
                              Text(
                                "No. of guests : ",
                                style: TextStyle(fontSize: REGULAR_FONT_SIZE),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AppConstants().width * 0.218),
                                child: Text(
                                  widget.list.noOfGuests[index].toString(),
                                  style: TextStyle(
                                      color: TEXT_COLOR[index % 4],
                                      fontSize: DEFAULT_FONT_SIZE),
                                ), //model
                              ), //model

                              Text(
                                "Time : ",
                                style: TextStyle(fontSize: REGULAR_FONT_SIZE),
                              ),
                              Text(
                                widget.list.time[index],
                                style: TextStyle(
                                    color: TEXT_COLOR[index % 4],
                                    fontSize: DEFAULT_FONT_SIZE),
                              ) //model
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Guest type      : ",
                              style: TextStyle(fontSize: REGULAR_FONT_SIZE),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: AppConstants().width * 0.136),
                              child: Text(
                                widget.list.guestType[index],
                                style: TextStyle(
                                    color: TEXT_COLOR[index % 4],
                                    fontSize: DEFAULT_FONT_SIZE),
                              ),
                            ), //model
                            Text(
                              "Date : ",
                              style: TextStyle(fontSize: REGULAR_FONT_SIZE),
                            ),
                            Text(
                              widget.list.date[index],
                              style: TextStyle(
                                  color: TEXT_COLOR[index % 4],
                                  fontSize: DEFAULT_FONT_SIZE),
                            ) //model
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Row(
                            children: [
                              RescheduleButton(
                                index: index % 4,
                              ),
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
                                        primary: BG_COLOR[index % 4] //model
                                        ),
                                    onPressed: () {},
                                    child: Text("Decline",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: REGULAR_FONT_SIZE))),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size(
                                          AppConstants().width * 0.256,
                                          LARGE_PAD_VER),
                                      primary: Color(0xff272F3D) //model
                                      ),
                                  onPressed: () {},
                                  child: Text(
                                    "Accept",
                                    style:
                                        TextStyle(fontSize: REGULAR_FONT_SIZE),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
