import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';
class IdDropdown extends StatefulWidget {
  const IdDropdown({Key? key}) : super(key: key);

  @override
  State<IdDropdown> createState() => _IdDropdownState();
}

class _IdDropdownState extends State<IdDropdown> {
  List<String> drop = ['Aadhar', 'Pan', 'Voter Id'];
  int index = 0;
  String dropdownvalue = "Aadhar";
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
