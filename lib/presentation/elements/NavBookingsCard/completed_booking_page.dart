
import 'package:flutter/material.dart';

import 'completed_booking_card.dart';



class CompletedBookingPage extends StatelessWidget {
  const CompletedBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              child: CompletedBookingsCard(index: index,),
            );
          }),
    );
  }
}