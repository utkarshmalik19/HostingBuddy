import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaffold/utils/consts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xff1A191E),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          height: MediaQuery.of(context).size.height * 0.20,
          //color: Colors.yellow,
        ),
        Padding(
          // Need to remove scrolling but overflow problem
          padding:  EdgeInsets.only(top: V_LARGE_PAD_VER),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              //  physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: MEDIUM_PAD_2_HOR),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      Text("Your Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: V_LARGE_FONT_SIZE,
                              color: Colors.white)),
                      Padding(
                        padding:  EdgeInsets.only(left: AppConstants().width*0.3),
                        child: GestureDetector(
                          child: Container(
                              width: AppConstants().width*0.128,
                              height: AppConstants().height*0.05,
                              decoration: BoxDecoration(
                                  color: Color(0xffEEECF8),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(Icons.check)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: AppConstants().width*0.42, top: MEDIUM_PAD_VER, right: VV_SMALL_PAD_VER/2),
                  child: CircleAvatar(
                    minRadius: 5,
                    maxRadius: 40,
                    child: Image.asset("assets/img_1.png"),
                  ),
                ),
                Center(
                    child: Text(
                  "Change Profile photo",
                  style: TextStyle(color: Color(0xff7664E1), fontSize: MED_FONT_SIZE_2),
                )),
                Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: LARGE_PAD_HOR, vertical: MEDIUM_PAD_VER),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right: V_SMALL_PAD_HOR),
                              child: SvgPicture.asset("assets/img/contact.svg"),
                            ),
                            Text(
                              "Contact Information",
                              style: TextStyle(
                                  color: Color(0xff8F7EF3),
                                  fontSize: MED_FONT_SIZE_2,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "Name",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "E-mail Address",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "Phone Number ",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "Alternate Phone Number",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: V_SMALL_PAD_HOR),
                                child:
                                    SvgPicture.asset("assets/img/contact.svg"),
                              ),
                              Text(
                                "Bank Information",
                                style: TextStyle(
                                    color: Color(0xff8F7EF3),
                                    fontSize: MED_FONT_SIZE_2,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "Account Holder Name",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                        Padding(
                          padding:  EdgeInsets.only(top: MEDIUM_PAD_2_VER),
                          child: Text(
                            "Account Number",
                            style: TextStyle(color: Color(0xffA59A9A)),
                          ),
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                width: AppConstants().width*0.256, child: Image.asset("assets/img/circle.png"))),
      ],
    ));
  }
}
