import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanWithLink extends StatelessWidget {
  final String normalText;
  final String linkText;
  final Function()? onLinkTap;
  TextSpanWithLink(
      {required this.normalText,
      required this.linkText,
      required this.onLinkTap});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(children: [
              new TextSpan(
                text: normalText,
                style: new TextStyle(color: Colors.black),
              ),
              new TextSpan(
                  text: linkText,
                  style: new TextStyle(color: Colors.blue),
                  recognizer: new TapGestureRecognizer()..onTap = onLinkTap)
            ])));
  }
}
