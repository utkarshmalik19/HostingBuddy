import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

class ScheduleTb extends StatefulWidget {
  const ScheduleTb({Key? key}) : super(key: key);

  @override
  State<ScheduleTb> createState() => _ScheduleTbState();
}

class _ScheduleTbState extends State<ScheduleTb> {
  List eventsList = List<EventCard>.generate(10, (index) {
    return EventCard('John', '30 june');
  });

  //List<String> drop = ['1 hour', '30 mins', 'c'];
  String viewType = "Week View";
  bool isWeek = true;
  String dropdownvalue = "1 hour";
  var num = 1;
  ScrollController _dayLayerScrollController = new ScrollController(
      initialScrollOffset: DateTime.now().hour / 24, keepScrollOffset: false);
  ScrollController _eventLayerScrollController = new ScrollController(
      initialScrollOffset: DateTime.now().hour / 24, keepScrollOffset: false);
  @override
  void initState() {
    _eventLayerScrollController.addListener(() {
      setState(() {
        _dayLayerScrollController.jumpTo(_eventLayerScrollController.offset);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (viewType == "Week View") {
                      viewType = "Calender View";
                      isWeek = false;
                    } else {
                      viewType = "Week View";
                      isWeek = true;
                    }
                  });
                },
                child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffF2F0DF),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Color(0xffE08600),
                            width: 2)),
                    child: Center(
                        child: Text(
                      viewType,
                      style: TextStyle(color: Color(0xffE08600)),
                    ))),
              ),
            )
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: 24,
                  controller: _dayLayerScrollController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                      "${index + num} ${index > 11 ? 'PM' : 'Am'}"),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    child: Divider(
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              ListView.builder(
                  controller: _eventLayerScrollController,
                  itemCount: 24,
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(color: Color(0xffEEFCEC)),
                            width: 50,
                            height: 55 * 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 25, left: 8),
                                  child: Text("5 am - 7 am"),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: CircleAvatar(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("Thinnai : By the way"),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 8),
                                      child: SizedBox(
                                        width: 60,
                                        height: 30,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xffC6E8C1)),
                                            child: Text("View Details",
                                                style: TextStyle(
                                                    fontSize: 7,
                                                    color: Color(0xff577D52)))),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffC6E8C1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 20,
                                      width: 20,
                                      child: Icon(Icons.call),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 90,
                        ));
                  })
            ],
          ),
        ),
      ],
    );
  }
}

class EventCard {
  final String name;
  final String date;

  EventCard(this.name, this.date);
}
