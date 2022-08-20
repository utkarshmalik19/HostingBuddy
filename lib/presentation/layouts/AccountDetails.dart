import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scaffold/presentation/elements/drop_down-2.dart';

import '../../utils/consts.dart';
import '../elements/id_dropdown.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  late File _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Account Details",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: V_LARGE_FONT_SIZE),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SMALL_PAD_HOR),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MEDIUM_PAD_VER, left: V_LARGE_PAD_HOR),
                child: Text(
                  "Provide us with your basic details",
                  style: TextStyle(fontSize: DEFAULT_FONT_SIZE),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "Account Holder Name",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Account Holder Name',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "Account Number",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Account Number',
                  border: OutlineInputBorder(
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "Rewrite Account Number ",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "IFSC Code",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter IFSC code',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SMALL_PAD_VER),
                child: Text(
                  "Upload Govt. Verified Photo ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: MED_FONT_SIZE),
                ),
              ),
              Text("(Aadhar, Passport, Driver's License, Voter ID)"),
              Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: getImage,
                        child: SizedBox(
                          width: AppConstants().width * 0.43,
                          height: AppConstants().height * 0.15,
                          child: Container(
                            // Not centred
                            child: SvgPicture.asset("assets/img/add_image.svg"),
                            color: Color(0xffFAF9FF),
                            padding: EdgeInsets.only(
                                left: 10,
                                bottom: V_SMALL_PAD_VER,
                                right: AppConstants().width * 0.35,
                                top:
                                    SMALL_PAD_VER), //padding of outer Container
                          ),
                        ),
                      ),
                      Text("Front Side")
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: V_SMALL_PAD_HOR / 2),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: getImage,
                          child: SizedBox(
                            width: AppConstants().width * 0.43,
                            height: AppConstants().height * 0.15,
                            child: Container(
                              child: SvgPicture.asset("assets/img/add_image.svg"),
                              color: Color(0xffFCFBF4),
                              padding: EdgeInsets.only(
                                  left: V_SMALL_PAD_HOR,
                                  bottom: V_SMALL_PAD_VER,
                                  right: AppConstants().width * 0.35,
                                  top: SMALL_PAD_VER), //padding of outer Container
                            ),
                          ),
                        ),
                        Text("Back Side")
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "ID Uploaded Type: ",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              IdDropdown(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: Text(
                  "ID Number",
                  style: TextStyle(
                      fontSize: MED_FONT_SIZE, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: LARGE_PAD_HOR * 3, top: MEDIUM_PAD_VER),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppConstants().width * 0.3,
                      height: V_LARGE_PAD_VER,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SMALL_PAD_HOR),
                      child: SizedBox(
                        width: AppConstants().width * 0.3,
                        height: V_LARGE_PAD_VER,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff8F7EF3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text("Submit")),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
