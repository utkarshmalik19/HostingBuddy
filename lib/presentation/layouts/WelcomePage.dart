import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/consts.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                    "Welcome",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: V_LARGE_FONT_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: V_LARGE_PAD_HOR),
              child: Text(
                  "Hey Arvanith, Congratulation on taking first step for your thinnai   hosting journey!"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: V_LARGE_PAD_HOR, vertical: LARGE_PAD_VER),
              child: SvgPicture.asset("assets/img/welcome_host.svg"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
              child: Text(
                "Start your Journey as a host now!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: V_LARGE_PAD_HOR),
              child: Text(
                  "Get started by adding details about yourself and your space! "),
            ),
            Padding(
              padding:  EdgeInsets.only(left: V_LARGE_PAD_HOR,top: V_LARGE_PAD_VER),
              child: SizedBox(
                width: AppConstants().width * 0.79,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Get Started")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
