
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/consts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> imgList = [
    'assets/img/intro1.svg',
    'assets/img/intro2.svg',
    'assets/img/intro3.svg',
  ];
  int _current = 0;
  final List<String> titles = [
    'Create a beautiful space',
    'Host Beautiful People',
    'Make Beautiful Memories',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: MEDIUM_PAD_VER, left: LARGE_PAD_HOR, right: MEDIUM_PAD_HOR),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios),
                Padding(
                  padding:  EdgeInsets.only(top: LARGE_PAD_VER),
                  child: SvgPicture.asset(imgList[_current]),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: MEDIUM_PAD_VER, bottom: SMALL_PAD_VER),
                  child: Text(
                    titles[_current],
                    style: TextStyle(
                        fontSize: V_LARGE_FONT_SIZE, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Some description for this slide",
                  style: TextStyle(
                      color: Color(0xff656565), fontSize: MED_FONT_SIZE),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: V_LARGE_PAD_VER ),
                  child: Row(
                    children: [
                      //Container(height: 100,decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(100)),)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: V_LARGE_PAD_HOR*2,bottom: V_LARGE_PAD_VER),
                  child: SizedBox(
                    width: AppConstants().width * 0.51,
                    child: ElevatedButton(
                        onPressed: () {
                        setState(() {
                          _current =_current+1;
                        });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff8F7EF3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: V_LARGE_PAD_HOR, right: SMALL_PAD_HOR),
                              child: Text("Next"),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        )),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _current = _current+1;
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Skip",
                            style: TextStyle(color: Color(0xff8F7EF3))),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
