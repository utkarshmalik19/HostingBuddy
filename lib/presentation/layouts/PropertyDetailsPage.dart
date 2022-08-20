import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/consts.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  var myMenuItems = <String>[
    'Edit',
    'Hide',
    'Delete',
  ];
  // var icons = <String>[
  //   'edit',
  //   'red'
  // ];
  final steps = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo",
    "Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor siadipiscing elit, sed do eiusmod tempo",
    "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempousmod tempo",
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

  ];
  void onSelect(item) {
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

  final List<String> imgList = [
    'assets/img/property.png',
    'assets/img/property.png',
    'assets/img/property.png',
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  GoogleMapController? controller;
  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.asset(
              item,
              fit: BoxFit.cover,
            )))
        .toList();

    final _markDownData = steps.map((x) => "- $x\n").reduce((x, y) => "$x$y");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Property Name",
          style: TextStyle(color: Colors.black, fontSize: LARGE_FONT_SIZE),
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
        actions: <Widget>[
          PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
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
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants().width * 0.046),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppConstants().height * 0.037),
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.29,
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: AppConstants().width * 0.02,
                          height: AppConstants().height * 0.014,
                          margin: EdgeInsets.symmetric(
                              vertical: AppConstants().height * 0.004,
                              horizontal: AppConstants().width * 0.007),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
                //Image.asset("assets/property.png"),
              ),
              Text(
                "About Thinnai Space",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppConstants().height * 0.005,
                    bottom: AppConstants().height * 0.035),
                child: Text(
                  " \"Lorem ipsum dolor sit amet. Et eveniet nobis et nisi voluptatem id asperiores voluptates. Ut distinctio quam id animi magni vel nihil impedit rem voluptas ducimus aut nihil iste quas laudantium et consequuntur repellat?\" ",
                ),
              ),
              Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppConstants().height * 0.009,
                    bottom: AppConstants().height * 0.018),
                child: Text(
                  "House no., apartment name, floor, block, city, state, pin \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\" ",
                ),
              ),
              // Showing blank Map
              // Center(
              //   child: SizedBox(
              //     width: 350.0,
              //     height: 300.0,
              //     child: GoogleMap(
              //       initialCameraPosition: const CameraPosition(
              //         target: LatLng(28.626330828, 77.2184991),
              //         zoom: 7.0,
              //       ),
              //       // tileOverlays: overlays,
              //       // onMapCreated: _onMapCreated,
              //     ),
              //   ),
              // ),
              Text(
                "URL for Space",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff383838),
                    fontSize: MED_FONT_SIZE),
              ),
              Text(
                  "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit\""),
              Padding(
                padding: EdgeInsets.only(top: AppConstants().height * 0.035),
                child: Text("Steps to Reach Thinnai ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff383838),
                        fontSize: MED_FONT_SIZE)),
              ),
              Container(
                  height: AppConstants().height * 0.3,
                  child: Markdown(data: _markDownData)),

              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    if (index != 0 && index != 8 && index != 11) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppConstants().height * 0.014),
                            child: Text(titles[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff383838),
                                    fontSize: MED_FONT_SIZE)),
                          ),
                          chipList()
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(titles[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff383838),
                          fontSize: MED_FONT_SIZE)),

                          Container(
                            width: AppConstants().width * 0.24,
                            height: MEDIUM_PAD_VER,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Center(child: Text("Yes")),
                          )
                        ],
                      );
                    }
                  }),
              Padding(
                padding: EdgeInsets.only(top: AppConstants().height * 0.028),
                child: Text('Maximum Guest Number',
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
                child: Center(child: Text("6 Guests")),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstants().height * 0.028),
                child: Text('Visibility Of Space',
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
              Text("House rules",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff383838),
                      fontSize: MED_FONT_SIZE)),
              Container(height: 200, child: Markdown(data: _markDownData)),
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
        _buildChip('Apartment', true),
        _buildChip('Individual space', false),
        _buildChip('Balcony', false),
        _buildChip('Balcony', true),
        _buildChip('Balcony', false),
        _buildChip('Balcony', true),
      ],
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      labelPadding: EdgeInsets.all(AppConstants().width * 0.005),
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xffE7F0F4),
      elevation: 0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(AppConstants().width * 0.02),
    );
  }
}
