import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

import '../elements/TabBar/inquiry_tab_bar.dart';
import '../elements/drop_down-2.dart';
import 'CustomScaffold.dart';

class InquiriesPage extends StatefulWidget {
  const InquiriesPage({Key? key}) : super(key: key);

  @override
  State<InquiriesPage> createState() => _InquiriesPageState();
}

class _InquiriesPageState extends State<InquiriesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 35,bottom: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  Text(
                    "Inquiries",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: V_LARGE_FONT_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
              child: DropDown2(),
            ),
            Expanded(child: InquiryTabBar())
          ],
        ));
  }
}
