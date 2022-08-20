import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import 'layouts/CustomScaffold.dart';

class QueryPage extends StatelessWidget {
  const QueryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: V_LARGE_PAD_VER,left: V_LARGE_PAD_HOR,bottom: SMALL_PAD_VER),
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
                  return ExpansionTile(
                    title: Text("Hello"),
                    //  trailing: Icon(Icons.arrow_forward_ios),
                    children: [
                      Text(
                          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam con.")
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
