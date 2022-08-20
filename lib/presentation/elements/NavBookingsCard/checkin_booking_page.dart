import 'package:flutter/material.dart';


import 'checkin_booking_card.dart';

class CheckInBookingPage extends StatefulWidget {
  const CheckInBookingPage({Key? key}) : super(key: key);

  @override
  State<CheckInBookingPage> createState() => _CheckInBookingPageState();
}

class _CheckInBookingPageState extends State<CheckInBookingPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: CheckInBookingCard( index: index,),
            );
          }),
    );
  }
}
