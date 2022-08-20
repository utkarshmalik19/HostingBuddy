import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/consts.dart';
import '../elements/language_tag.dart';



class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();


}

class _PersonalDetailsState extends State<PersonalDetails> {
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

    bool _isMale = false;
    bool _isFemale = false;
    bool _isTransgender = false;
    bool isChecked = false;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Personal Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: V_LARGE_FONT_SIZE),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SMALL_PAD_HOR),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: V_LARGE_PAD_VER,left: V_LARGE_PAD_HOR),
                child: Text("Provide us with your basic details",style: TextStyle(fontSize: DEFAULT_FONT_SIZE),),
              ),
              Text("Upload Your Picture",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MED_FONT_SIZE),),
              Text("Your face should be clearly visible."),
              GestureDetector(
                onTap: getImage,
                child: Container(
                  width: AppConstants().width*0.58,
                  height: AppConstants().height*0.2,
                  color: Color(0xffEEEEEE),
                  padding: EdgeInsets.only(left: 10,bottom: V_SMALL_PAD_VER, right: AppConstants().width*0.35,top: SMALL_PAD_VER), //padding of outer Container
                    child: Padding(
                      padding:  EdgeInsets.only(left: AppConstants().width*0.153),
                      child: Center(child: SvgPicture.asset("assets/img/add_image.svg")),
                    )
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: MEDIUM_PAD_VER),
                child: Column(children: [

                ]),

              ),
              Text(
                "About Yourself",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE),
              ),

              Padding(
                  padding:  EdgeInsets.only(top: V_SMALL_PAD_VER, bottom: MEDIUM_PAD_VER),
                  child:Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                Border.all(width: 0.5, color: Color(0xff383838))),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration.collapsed(hintText: '''' Write us a Lively description of yourself, 
 what you do, for guest to understand you 
 better''',),
                              minLines: 5,
                            ),
                          ),
                          //
                        ],
                      ))
              ),
              Text(
                "Interest and Passion",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE),
              ),

              Padding(
                  padding:  EdgeInsets.only(top: V_SMALL_PAD_VER, bottom: MEDIUM_PAD_VER),
                  child:Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                Border.all(width: 0.5, color: Color(0xff383838))),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration.collapsed(hintText: " Write About..",),
                              minLines: 3,
                            ),
                          ),
                          //
                        ],
                      ))
              ),
              Row(
                children: [
                  Text(
                    "Permanent Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff383838),
                        fontSize: MED_FONT_SIZE),
                  ),
                  Checkbox(value: isChecked,
                      checkColor: Colors.black,

                      onChanged: (bool? isChecked){setState(() {

                    isChecked = true;
                  });}),
                  Text("Same as thinnai address",style: TextStyle(color: Color(0xffA59A9A)),)
                ],
              ),
              Padding(
                  padding:  EdgeInsets.only(top: V_SMALL_PAD_VER,bottom: SMALL_PAD_VER),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: V_SMALL_PAD_VER),
                        child: Row(
                          children: [
                            Text("City:",style: TextStyle(fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold),),
                            Padding(
                              padding:  EdgeInsets.only(left: AppConstants().width*0.38),
                              child: Text("State:",style: TextStyle(fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(bottom: V_SMALL_PAD_VER),
                        child: Row(
                          children: [
                            Container(
                              width: AppConstants().width*0.44,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                            SizedBox(
                              width: V_SMALL_PAD_HOR,
                            ),
                            Container(
                              width: AppConstants().width*0.44,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("Pincode:",style: TextStyle(fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold),),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:V_SMALL_PAD_VER),
                        child: Text("Profession:",style: TextStyle(fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold),),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),

                        ),
                      ),
                      Text("Gender:",style: TextStyle(fontSize: REGULAR_FONT_SIZE,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          ChoiceChip(
                              onSelected: (bool _isMale){
                                setState(() {
                                  _isMale = true;
                                });
                              },
                              disabledColor: Colors.white,
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                              labelStyle: TextStyle(color: Colors.black),
                              labelPadding: EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR,vertical: V_SMALL_PAD_VER/2),
                              label: Row(children: [Icon(Icons.male),Text("Male")],), selected: _isMale),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR),
                            child: ChoiceChip(
                              onSelected: (bool _isFemale){
                                setState(() {
                                  _isFemale = true;
                                });
                              },
                                disabledColor: Colors.white,
                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                                labelStyle: TextStyle(color: Colors.black),
                                labelPadding: EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR,vertical: V_SMALL_PAD_VER/2),
                                label: Row(children: [Icon(Icons.female),Text("Female")],), selected: _isFemale),
                          ),
                          ChoiceChip(
                              onSelected: (bool _isTransgender){
                                setState(() {
                                  _isTransgender = true;
                                });
                              },
                              disabledColor: Colors.white,
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                              labelStyle: TextStyle(color: Colors.black),
                              labelPadding: EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR,vertical: V_SMALL_PAD_VER/2),
                              label: Row(children: [Icon(Icons.transgender),Text("Transgender")],), selected: _isTransgender),
                        ],
                      ),

                    ],
                  )
              ),

              Padding(
                padding:  EdgeInsets.only(top:SMALL_PAD_VER),
                child: Text('Date of Birth :',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: REGULAR_FONT_SIZE)),
              ),
              Row(
                children: [
                  DropdownButton<String>(
                    value: '4',

                    items: <String>['1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_){},
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR),
                    child: DropdownButton<String>(
                      value: 'March',

                      items: <String>['Jan', 'Feb', 'March', 'April'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_){},
                    ),
                  ),
                  DropdownButton<String>(
                    value: '2022',

                    items: <String>['2001', '2005', '2020', '2022'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_){},
                  ),
                ],
              ),
              Text('Languages Known',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff383838),
                      fontSize: MED_FONT_SIZE)),
              LanguageTag(),

              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR*3, top: LARGE_PAD_VER),
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
