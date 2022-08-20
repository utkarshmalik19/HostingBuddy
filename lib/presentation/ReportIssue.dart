import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scaffold/utils/consts.dart';

import 'layouts/CustomScaffold.dart';

class ReportIssue extends StatefulWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  List<String> drop = ['Select Property', 'b', 'c'];
  int index = 0;
  String dropdownvalue = "Select Property";
  late File _image;
  Future getImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemporary = File(image.path);
    setState((){
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: SMALL_PAD_HOR),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Report An Issue",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: V_LARGE_FONT_SIZE),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.0094, bottom: AppConstants().height*0.035),
                child: Container(
                  child: Text("Report New Issue"),
                ),
              ),
              Text("Select Type Of Issue"),
              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.0094, bottom: MEDIUM_PAD_2_VER,right: MEDIUM_PAD_2_HOR),
                child: DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff50555C))),
                      filled: true,
                      hintStyle: TextStyle(color: Color(0xffE8E7E7)),
                      hintText: "Name",
                      fillColor: Colors.white),
                  icon: Icon(Icons.arrow_drop_down),
                  value: dropdownvalue,
                  items: drop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      this.dropdownvalue = value!;
                    });
                  },
                ),
              ),
              Text("About"),
              Padding(
                padding:  EdgeInsets.only(top: AppConstants().height*0.0094,bottom: MEDIUM_PAD_VER,right: MEDIUM_PAD_2_HOR),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5, color: Color(0xff383838))),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                      hintText: " Describe your Issue",
                    ),
                    minLines: 5,
                  ),
                ),
              ),
              Text("Add photos"),
             Row(
               children: [
                 GestureDetector(
                     onTap:  getImage,
                     child: SizedBox(height: AppConstants().height*0.1,width: AppConstants().width*0.43,child: Image.asset("assets/img/placeholder.png"))),
                 GestureDetector(
                     onTap: getImage,
                     child: SizedBox(height: AppConstants().height*0.1,width: AppConstants().width*0.43,child: Image.asset("assets/img/placeholder.png"))),
               ],
             ),
              Padding(
                padding:  EdgeInsets.only(top: V_LARGE_PAD_VER*2),
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff272F3D)
                    ),
                    child: Text("Report")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
