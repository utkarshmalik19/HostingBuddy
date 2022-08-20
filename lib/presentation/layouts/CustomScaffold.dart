import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                left: 230,
                child: SizedBox(
                  height: 150,
                    width: 200,child: Image.asset("assets/img/circle.png"))),
            body

          ],
        ),
      ),
    );
  }
}
