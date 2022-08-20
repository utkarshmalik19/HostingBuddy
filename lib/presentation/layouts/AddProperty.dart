import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/consts.dart';



class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();


}

class _AddPropertyState extends State<AddProperty> {
  var myMenuItems = <String>[
    'Edit',
    'Hide',
    'Delete',
  ];


  List<String> titles = [
    'Rain Proof/Sun Proof ',
    'Amenties',
    'Preferred Guests',
    'Type of activities',
    'Parking',
    'Guest Can be Allowed ',
    'Alcohol Allowed For',
    'Auto Accept Inquiries',

  ];  void onSelect(item) {
    switch (item) {
      case 'Edit':
        print('Home clicked');
        break;
      case 'Hide':
        print('Profile clicked');
        break;
      case 'Delete':
        print('Setting clicked');
        break;
    }
  }

  int _current = 0;
  // final CarouselController _controller = CarouselController();
  GoogleMapController? controller;
  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Property Name",style: TextStyle(color: Colors.black,fontSize: LARGE_FONT_SIZE),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(Icons.more_vert,color: Colors.black,),
              onSelected: onSelect,
              itemBuilder: (BuildContext context) {
                return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              })
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SMALL_PAD_HOR),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: getImage,
                child: Container(

                    padding: EdgeInsets.symmetric(horizontal: AppConstants().width*0.02,vertical: V_SMALL_PAD_VER), //padding of outer Container
                    child: Image.asset("assets/img/placeholder.png")
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: AppConstants().height*0.03),
                child: Column(children: [


                ]),

              ),
              Text(
                "About Thinnai Space",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: 16),
              ),
              Padding(
                  padding:  EdgeInsets.only(top: V_SMALL_PAD_VER, bottom: V_SMALL_PAD_VER*3),
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
                              decoration: InputDecoration.collapsed(hintText: " Describe your property",),
                              minLines: 5,
                            ),
                          ),
                          //
                        ],
                      ))
              ),
              Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE),
              ),
              Padding(
                  padding:  EdgeInsets.only(top: AppConstants().height*0.009,bottom: SMALL_PAD_VER),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Complete Address',
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                        child: Row(
                          children: [
                            Container(
                              width: AppConstants().width*0.448,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Floor',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: AppConstants().width*0.448,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Tower/Block no.',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nearby Landmark',
                        ),
                      ),
                    ],
                  )
              ),
              // Showing blank Map

              Padding(
                padding:  EdgeInsets.only(top: V_SMALL_PAD_VER*3),
                child: Text("Steps to Reach Thinnai ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '. Step by Step guid to reach Thinnai',
                  ),
                ),
              ),


              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: titles.length,
                  itemBuilder: (context,index){

                    if (index == 0 || index == 7) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(titles[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff383838),
                                  fontSize: MED_FONT_SIZE)),

                          Row(
                            children: [
                              Container(
                                width: AppConstants().width * 0.24,
                                height: MEDIUM_PAD_VER,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Color(0xffC4C4C4))),
                                child: Center(child: Text("Yes")),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: V_SMALL_PAD_HOR/2),
                                child: Container(
                                  width: AppConstants().width * 0.24,
                                  height: MEDIUM_PAD_VER,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Color(0xffC4C4C4))),
                                  child: Center(child: Text("No")),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ListTile(
                            title: Text(titles[index],style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff383838),
                                fontSize: MED_FONT_SIZE),),
                            trailing: GestureDetector(
                                onTap: (){
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Center(child: Text("Add Amenties")),
                                      content: Container(
                                        height: MediaQuery.of(context).size.height *
                                            0.22,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Type the amenities that you are going to provide."),
                                            Padding(
                                              padding:  EdgeInsets.only(top: SMALL_PAD_VER),
                                              child: Container(
                                                decoration: BoxDecoration(

                                                    border: Border.all(
                                                        width: 1,
                                                        color: Color(0xff383838))),
                                                child: TextFormField(

                                                  decoration:
                                                  InputDecoration.collapsed(
                                                    hintText: "Enter your amenities",
                                                  ),

                                                ),

                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(top: MEDIUM_PAD_VER),
                                              child: Container(
                                                color: Color(0xffF2F0DF),
                                                child: Text("Your choice has been sent for approval. When approved , Thinnai team will inform you & your choice wil get updated.",
                                                style: TextStyle(fontSize: 12,color: Color(0xffAD6800)),),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: SizedBox(
                                            width: AppConstants().width*0.384,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.black),
                                              onPressed: () {
                                                Navigator.pop(context, 'Cancel');
                                              },
                                              child: Text(
                                                "Save",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Icon(Icons.add)),
                          ),
                          chipList()
                        ],
                      );

                    }
                  }),
              Padding(
                padding:  EdgeInsets.only(top:AppConstants().height*0.028),
                child: Text('Maximum Guest Number',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE)),
              ),
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
              Text('Visibility Of Space',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff383838),
                      fontSize: MED_FONT_SIZE)),
              Container(
                width: AppConstants().width * 0.24,
                height: MEDIUM_PAD_VER,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffC4C4C4))),
                child: Center(child: Text("30 Days")),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstants().height * 0.028),
                child: Text('Minimum Booking Hours',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff383838),
                        fontSize: MED_FONT_SIZE)),
              ),
              Container(
                width: AppConstants().width * 0.24,
                height: MEDIUM_PAD_VER,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffC4C4C4))),
                child: Center(child: Text("1 hour")),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstants().height * 0.028),
                child: Text('A Question',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff383838),
                        fontSize: MED_FONT_SIZE)),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: VV_SMALL_PAD_VER),
                child: Text("Explaination"),
              ),
              Container(
                width: AppConstants().width * 0.24,
                height: MEDIUM_PAD_VER,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffC4C4C4))),
                child: Center(child: Text("Yes")),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: VV_SMALL_PAD_VER),
                child: Text("FAQs",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff383838),
                        fontSize: MED_FONT_SIZE)),
              ),
              Text("Nothing added for now, click edit to add"),
              Text("House rules",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff383838),
                  fontSize: MED_FONT_SIZE)),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: V_SMALL_PAD_VER*2),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '. Any house rules you would like to inform the guests',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  chipList() {
    bool isSelected = false;
    return Wrap(
      spacing: 6.0,
      runSpacing: 1.0,
      children: <Widget>[
        _buildChip('Apartment',true),
        _buildChip('Individual space',false),
        _buildChip('Balcony',false),
        _buildChip('Balcony',true),
        _buildChip('Balcony',false),
        _buildChip('Balcony',true),

      ],
    );
  }

  Widget _buildChip(String label,bool isSelected) {
    int color;
    if (isSelected){
      color = 0xffF2F0DF;
    }
    else
      color = 0xffE7F0F4;
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      labelPadding: EdgeInsets.all(2.0),

      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xffD9D9D9),
      elevation: 0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}