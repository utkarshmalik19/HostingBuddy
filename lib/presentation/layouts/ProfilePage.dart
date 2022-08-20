import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scaffold/presentation/HelpAndSupportPage.dart';
import 'package:scaffold/presentation/elements/bar_chart.dart';
import 'package:scaffold/presentation/layouts/AddProperty.dart';

import '../../utils/consts.dart';
import '../elements/BottomNavBar.dart';
import 'EditProfilePage.dart';
import 'PropertyDetailsPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff1A191E),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              height: MediaQuery.of(context).size.height * 0.40,
              //color: Colors.yellow,
            ),
            Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    width: AppConstants().width*0.3, child: Image.asset("assets/img/circle.png"))),
            Padding(
              padding:  EdgeInsets.only(top: AppConstants().height*0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                //  physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: AppConstants().width*0.08),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text("Your Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: V_LARGE_TEXT,
                                color: Colors.white)),
                        Padding(
                          padding:  EdgeInsets.only(left: AppConstants().width*0.3),
                          //Svg img not showing properly
                          //  child: SvgPicture.asset("assets/img/wallet.svg"),
                          child: SizedBox(
                              width: AppConstants().width*0.1,
                              height: AppConstants().height*0.04,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HelpAndSupport()));
                                  },
                                  child: Image.asset("assets/img/wallet.png"))),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                             EdgeInsets.only(left: AppConstants().width*0.42, top: AppConstants().height*0.03, right: AppConstants().width*0.007),
                        child: CircleAvatar(
                          minRadius: 5,
                          maxRadius: 40,
                          child: Image.asset("assets/img_1.png"),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              },
                              child: Icon(Icons.edit, color: Colors.white))),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: AppConstants().width*0.42, top: AppConstants().height*0.02),
                    child: Text(
                      "Smita Rani",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MED_TEXT,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: AppConstants().width*0.3, top: AppConstants().height*0.003, bottom: AppConstants().height*0.003),
                    child: Text("Hostname@gmail.com",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: AppConstants().width*0.28),
                    child: Row(
                      children: [
                        Text(
                          "9685944890",
                          style: TextStyle(color: Color(0xff979595)),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.02),
                          child: Container(
                            width: AppConstants().width*0.005,
                            height: AppConstants().height*0.023,
                            color: Color(0xffC7D1E7),
                          ),
                        ),
                        Text("9685944890",
                            style: TextStyle(color: Color(0xff979595))),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: AppConstants().height*0.139),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: AppConstants().width*0.08, right: AppConstants().width*0.2),
                          child: Text("My Thinnai Spaces",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: LARGE_FONT_SIZE,
                                  fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddProperty()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            child: Row(
                              children: [Icon(Icons.add), Text("Add")],
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: AppConstants().width*0.07, right: AppConstants().width*0.07),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.86,
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              bool _switchValue = true;

                              return Padding(
                                padding:  EdgeInsets.only(top: AppConstants().height*0.019),
                                child: Container(
                                  color: BG_COLOR[index],
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PropertyDetails()));
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          child: Image.asset("assets/img_2.png")),
                                      title: Text("Name"),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "),
                                          Row(
                                            children: [
                                              Icon(Icons.check),
                                              Text(
                                                "Approved",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      trailing: CupertinoSwitch(
                                        value: _switchValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _switchValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // here
            Padding(
                padding:  EdgeInsets.only(left: AppConstants().width*0.11, right: AppConstants().width*0.11, top: AppConstants().height*0.37),
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    backgroundColor: Color(0xffEEFCEC),
                    collapsedBackgroundColor: Color(0xffEEFCEC),
                    trailing: Text(
                      "₹5200",
                      style: TextStyle(color: Color(0xffE08600)),
                    ),
                    title: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: AppConstants().width*0.017, ),
                          child: Icon(Icons.wallet),
                        ),
                        Text(
                          "Wallet",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: AppConstants().width*0.1, right: AppConstants().width*0.09),
                          child: Text(
                            "June 2022",
                            style: TextStyle(color: Color(0xffA1A1A1),fontSize: SMALL_TEXT),
                          ),
                        ),

                      ],
                    ),
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: AppConstants().width*0.041, right: AppConstants().width*0.041),
                        child: Container(
                          color: Color(0xffD6F2D2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        left: AppConstants().width*0.046, right: AppConstants().width*0.069),
                                    child: Text("Account Holder Name",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text("Hello", style: TextStyle(fontSize: 12))
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        left: AppConstants().width*0.046, right: AppConstants().width*0.069),
                                    child: Text("Account Number",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text("10001920029202028",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        left: AppConstants().width*0.046, right: AppConstants().width*0.069),
                                    child: Text(
                                      "IFSC Code",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "HDFC393033",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: AppConstants().width*0.046,vertical: AppConstants().height*0.009),
                        child: Text("Note : All payout for a month is released on 1st of every subsequent month",style: TextStyle(fontSize: 10),),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.only(top: AppConstants().height*0.008),
                            child: Text("Last 6 months Earning"),
                          )),
                      BarCharts(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
