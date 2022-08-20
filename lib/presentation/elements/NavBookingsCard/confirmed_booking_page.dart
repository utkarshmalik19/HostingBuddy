import 'package:flutter/material.dart';

import 'confirmed_booking_card.dart';

class ConfirmedBookingPage extends StatelessWidget {
  const ConfirmedBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: ConfirmedBookingsCard(index: index,),
            );
          }),
    );
  }
}
