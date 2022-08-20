
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/consts.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = "data";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.1),
          child: Column(
            children: [
              SizedBox(height: AppConstants().height*0.236),
              SvgPicture.asset("assets/img/empty_list.png"),
              Padding(
                padding:  EdgeInsets.only(top: MEDIUM_PAD_VER,bottom: V_SMALL_PAD_VER),
                child: Text("No ${text} yet!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: LARGE_FONT_SIZE),),
              ),
              Text("We are waiting for your guest just as you are :)",style: TextStyle(color: Color(0xff50555C),fontSize: REGULAR_FONT_SIZE))
            ],
          ),
        ),
      ),
    );
  }
}
