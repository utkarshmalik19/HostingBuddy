import 'package:flutter/material.dart';
import 'package:scaffold/presentation/layouts/CustomScaffold.dart';
import 'package:scaffold/utils/consts.dart';

import '../elements/TabBar/review_tab_bar.dart';
import '../elements/drop_down-2.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: V_LARGE_PAD_VER,
                  left: V_LARGE_PAD_HOR,
                  bottom: SMALL_PAD_VER),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  Text(
                    "Review",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: V_LARGE_FONT_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
              child: DropDown2(),
            ),
            Expanded(child: ReviewTabBar())
          ],
        ));
  }
}
