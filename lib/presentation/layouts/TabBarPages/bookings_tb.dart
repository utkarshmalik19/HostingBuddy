import 'package:flutter/material.dart';
import 'package:scaffold/presentation/elements/NavBookingsCard/cancelled_booking_page.dart';
import 'package:scaffold/presentation/elements/NavBookingsCard/confirmed_booking_page.dart';
import 'package:scaffold/presentation/elements/NavBookingsCard/requested_booking_page.dart';
import '../../../models/bookings_model.dart';
import '../../elements/NavBookingsCard/checkin_booking_page.dart';
import '../../elements/NavBookingsCard/completed_booking_page.dart';

class BookingsTb extends StatefulWidget {
  final String bookingType;
  BookingsTb({required this.bookingType});

  @override
  State<BookingsTb> createState() => _BookingsTbState();
}

class _BookingsTbState extends State<BookingsTb> {
  @override
  Widget build(BuildContext context) {
    print(widget.bookingType);
    switch (widget.bookingType) {
      case 'Check-in':
        return CheckInBookingPage();
      case 'Requests':
        return RequestBookingPage();
      case 'Confirmed':
        return ConfirmedBookingPage();
      case 'Completed':
        return CompletedBookingPage();
      case 'Cancelled':
        return CancelledBookingPage();
      default:
        return Text('Check Code');
    }
  }
}
