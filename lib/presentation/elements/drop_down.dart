import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<String> drop = ['Select Property', 'b', 'c'];
  int index = 0;
  String dropdownvalue = "Select Property";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        dropdownColor: Color(0xff333740),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: "Name",
            fillColor: Color(0xff333740)),
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
    );
  }
}
