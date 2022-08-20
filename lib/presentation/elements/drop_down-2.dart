import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';
class DropDown2 extends StatefulWidget {
  const DropDown2({Key? key}) : super(key: key);

  @override
  State<DropDown2> createState() => _DropDown2State();
}

class _DropDown2State extends State<DropDown2> {
  List<String> drop = ['Select Property', 'b', 'c'];
  int index = 0;
  String dropdownvalue = "Select Property";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.white,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: AppConstants().height*0.0011,color: Color(0xff50555C))
          ),
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
    );
  }
}
