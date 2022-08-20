import 'package:flutter/material.dart';
import 'package:scaffold/presentation/QueryPage.dart';
import 'package:scaffold/utils/consts.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> faqs = [
      'Bookings',
      'Feedbacks',
      'Reviews',
      'Account & Privacy'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Help & Support",
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        "FAQs",
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QueryPage()));
                    },
                    child: ListTile(
                      title: Text(faqs[index]),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
