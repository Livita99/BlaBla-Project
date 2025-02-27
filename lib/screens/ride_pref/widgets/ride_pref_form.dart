import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../service/locations_service.dart';
import '../../../theme/theme.dart';
import '../../../widgets/inputs/bla_button.dart';
import '../../../widgets/inputs/location_picker.dart';

///
/// A Ride Preference Form is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // List of locations for the dropdown menus
  final List<Location> locations = LocationsService.availableLocations;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------
  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    arrival = widget.initRidePref?.arrival;
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void _showLocationPicker(BuildContext context, bool isDeparture) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          child: LocationPicker(
            onLocationSelected: (Location location) {
              setState(() {
                if (isDeparture) {
                  departure = location;
                } else {
                  arrival = location;
                }
              });
            },
          ),
        );
      },
    );
  }

  void _showFullScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text('Full Screen Modal Dialog'),
            ),
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (departure != null && arrival != null && requestedSeats > 0) {
      final ridePref = RidePref(
        departure: departure!,
        departureDate: departureDate,
        arrival: arrival!,
        requestedSeats: requestedSeats,
      );
      Navigator.of(context).pop(ridePref);
    } else {
      // Show an error message if the form is not valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.radio_button_unchecked,
                color: departure != null
                    ? BlaColors.textNormal
                    : BlaColors.textLight,
              ),
              title: Text(
                departure?.name ?? 'Leaving from',
                style: BlaTextStyles.body.copyWith(
                  color: departure != null
                      ? BlaColors.textNormal
                      : BlaColors.textLight,
                ),
              ),
              onTap: () => _showLocationPicker(context, true),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.radio_button_unchecked,
                color: arrival != null
                    ? BlaColors.textNormal
                    : BlaColors.textLight,
              ),
              title: Text(
                arrival?.name ?? 'Going to',
                style: BlaTextStyles.body.copyWith(
                  color: arrival != null
                      ? BlaColors.textNormal
                      : BlaColors.textLight,
                ),
              ),
              onTap: () => _showLocationPicker(context, false),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today, color: BlaColors.textLight),
              title: Text(
                'Today',
                style: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
              ),
              onTap: () => _showFullScreenDialog(context),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person, color: BlaColors.textLight),
              title: Text(
                '1',
                style: BlaTextStyles.body.copyWith(color: BlaColors.textLight),
              ),
              onTap: () => _showFullScreenDialog(context),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: BlaButton(
                label: 'Search',
                buttonType: BlaButtonType.primary,
                onPressed: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
