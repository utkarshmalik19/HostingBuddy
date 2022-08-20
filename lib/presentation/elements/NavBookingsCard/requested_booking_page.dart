import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/NavBookingsCard/request_booking_card.dart';

class RequestBookingPage extends StatefulWidget {
  const RequestBookingPage({Key? key}) : super(key: key);

  @override
  State<RequestBookingPage> createState() => _RequestBookingPageState();
}

class _RequestBookingPageState extends State<RequestBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
        return Container(
          child: RequestsBookingCard(index: index,),
        );
      }),
    );
  }
}
