import 'package:flutter/material.dart';
import 'package:scaffold/presentation/IssuesPage.dart';
import 'package:scaffold/presentation/PreviousIssue.dart';
import 'package:scaffold/presentation/QueryPage.dart';
import 'package:scaffold/presentation/ReportIssue.dart';
import 'package:scaffold/presentation/layouts/FaqPage.dart';
import 'package:scaffold/utils/consts.dart';

import 'layouts/CustomScaffold.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Previous Reported Issues',
      'General Issues',
      'FAQs',
      'Terms & Conditions'
    ];
    return CustomScaffold(


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MEDIUM_PAD_2_VER),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: V_LARGE_PAD_VER,bottom: SMALL_PAD_VER),
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
              padding:  EdgeInsets.only(left: AppConstants().width*0.533),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportIssue()));
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xff272F3D)),
                  child: Text("Report An Issue")),
            ),
            Card(
              elevation: 0,
              color: Color(0xffF3F1FF),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You have 1 active issue",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IssuesPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Color(0xffDFDAFF)),
                            elevation: 0,
                            primary: Color(0xffF3F1FF)),
                        child: Text(
                          "View My Issue",
                          style: TextStyle(color: Color(0xff8F7EF3)),
                        ))
                  ],
                ),
                trailing: Icon(Icons.add),
              ),
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PreviousIssues()));
                      } else if (index == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => FaqPage()));
                      } else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QueryPage()));
                    },
                    child: Column(
                      children: [
                        index == 1
                            ? Padding(
                                padding:  EdgeInsets.only(top: AppConstants().height*0.035),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration:
                                      BoxDecoration(color: Color(0xffEBEBEB)),
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                        left: V_LARGE_PAD_HOR, top: V_SMALL_PAD_VER),
                                    child: Text(
                                      "HELP WITH OTHER QUERIES",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        ListTile(
                          title: Text(
                            titles[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
