import 'package:flight_booking/ui/home_page/widget/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlightBooking());
}

class FlightBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Booking',
      home: HomePage(),
    );
  }
}
