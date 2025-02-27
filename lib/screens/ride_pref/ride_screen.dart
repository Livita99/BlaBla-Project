import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../theme/theme.dart';

class RideScreen extends StatelessWidget {
  final RidePref ridePref;

  const RideScreen({super.key, required this.ridePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: BlaColors.backgroundAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: BlaColors.backgroundAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Departure: ${ridePref.departure.name}',
                  style: BlaTextStyles.body
                      .copyWith(color: BlaColors.neutralLight),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Arrival: ${ridePref.arrival.name}',
                  style: BlaTextStyles.body
                      .copyWith(color: BlaColors.neutralLight),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Departure Date: ${ridePref.departureDate}',
                  style: BlaTextStyles.body
                      .copyWith(color: BlaColors.neutralLight),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Requested Seats: ${ridePref.requestedSeats}',
                  style: BlaTextStyles.body
                      .copyWith(color: BlaColors.neutralLight),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
