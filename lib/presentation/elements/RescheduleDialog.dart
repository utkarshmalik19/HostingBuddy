import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/consts.dart';

class RescheduleButton extends StatefulWidget {
  final num index;

  RescheduleButton({required this.index});

  @override
  State<RescheduleButton> createState() => _RescheduleButtonState();
}

class _RescheduleButtonState extends State<RescheduleButton> {
  @override
  Widget build(BuildContext context) {
    int index = 0; //Constructor index
    String dropdownvalue = '0';
    String dropdownvalue2 = '0';
    String dropdownvalue3 = 'AM';
    // Temp values
    var items = List.generate(12, (index) => '$index');
    var items2 = List.generate(60, (index) => '$index');
    var items3 = ['AM', 'PM'];
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 1,
            minimumSize: Size(AppConstants().width * 0.256, LARGE_PAD_VER),
            primary: BUTTON_COLOR[index]),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Center(child: Text("Reschedule")),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: EdgeInsets.only(left: LARGE_PAD_HOR),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: SMALL_PAD_VER),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton(
                              onChanged: (value) {},
                              menuMaxHeight: AppConstants().height * 0.237,
                              value: dropdownvalue,
                              style: TextStyle(color: Color(0xff6053AE)),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SMALL_PAD_VER,
                                  right: AppConstants().width * 0.0128,
                                  left: AppConstants().width * 0.0128),
                              child: Text(" - "),
                            ),
                            DropdownButton(
                              onChanged: (value) {},
                              menuMaxHeight: AppConstants().height * 0.237,
                              value: dropdownvalue2,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items2.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppConstants().width * 0.0128),
                              child: DropdownButton(
                                onChanged: (value) {},
                                value: dropdownvalue3,
                                items: items3.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Center(
                  child: SizedBox(
                    width: AppConstants().width * 0.384,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        child: Text(
          "Reschedule",
          style: TextStyle(color: Colors.black),
        ));
  }
}
