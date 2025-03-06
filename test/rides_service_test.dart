import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/mock/mock_rides_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';

void main() {
  // Initialize the RidesService with MockRidesRepository
  RidesService.initialize(MockRidesRepository());

  group('RidesService Tests', () {
    test('T1: Create a ride preference and assert results', () {
      // Create a ride preference
      RidePreference preference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cambodia),
        arrival: Location(name: 'Siem Reap', country: Country.cambodia),
        departureDate: DateTime.now(),
        requestedSeats: 1,
      );

      // Get the rides
      List<Ride> rides = RidesService().getRides(preference, null);

      // Assert 4 results are displayed
      expect(rides.length, 4);

      // Assert 1 ride is full
      bool hasFullRide = rides.any((ride) => ride.availableSeats == 0);
      expect(hasFullRide, true, reason: 'Warning: 1 ride is full');
    });

    test('T2: Create a ride preference with pet filter and assert results', () {
      // Create a ride preference
      RidePreference preference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cambodia),
        arrival: Location(name: 'Siem Reap', country: Country.cambodia),
        departureDate: DateTime.now(),
        requestedSeats: 1,
      );

      // Create a ride filter
      RidesFilter filter = RidesFilter(petAccepted: true);

      // Get the rides
      List<Ride> rides = RidesService().getRides(preference, filter);

      // Assert 1 result is displayed
      expect(rides.length, 1);

      // Assert the result is for Mengtech
      expect(rides.first.driver.firstName, 'Mengtech');
    });
  });
}
