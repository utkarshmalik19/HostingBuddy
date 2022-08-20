import 'package:flutter/material.dart';


class AgeRange extends StatefulWidget {
  var color;
  var value;

  AgeRange({required this.color,required this.value});

  @override
  State<AgeRange> createState() => _AgeRangeState();
}

class _AgeRangeState extends State<AgeRange> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10,

        alignment: Alignment.center,
        // margin: EdgeInsets.all(20),
        child: LinearProgressIndicator(
          minHeight: 7,
          value: widget.value,
          valueColor: new AlwaysStoppedAnimation<Color>(Color(widget.color)),
          backgroundColor: Color(widget.color).withOpacity(0.3),
        )
    );
  }
}
