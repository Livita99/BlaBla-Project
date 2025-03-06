import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/user/user.dart';

class MockRidesRepository implements RidesRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
      arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
      driver: User(
        firstName: 'Kannika',
        lastName: 'Sok',
        email: 'kannika@example.com',
        phone: '123456789',
        profilePicture: 'https://randomuser.me/api/portraits/women/2.jpg',
        verifiedProfile: true,
      ),
      availableSeats: 2,
      pricePerSeat: 10.0,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 20)),
      arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
      driver: User(
        firstName: 'Chaylim',
        lastName: 'Sok',
        email: 'chaylim@example.com',
        phone: '123456789',
        profilePicture: 'https://randomuser.me/api/portraits/men/1.jpg',
        verifiedProfile: true,
      ),
      availableSeats: 0,
      pricePerSeat: 10.0,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
        firstName: 'Mengtech',
        lastName: 'Sok',
        email: 'mengtech@example.com',
        phone: '123456789',
        profilePicture: 'https://randomuser.me/api/portraits/men/2.jpg',
        verifiedProfile: true,
      ),
      availableSeats: 1,
      pricePerSeat: 10.0,
      acceptPets: true,
    ),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 20)),
      arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
      driver: User(
        firstName: 'Limhao',
        lastName: 'Sok',
        email: 'limhao@example.com',
        phone: '123456789',
        profilePicture: 'https://randomuser.me/api/portraits/men/3.jpg',
        verifiedProfile: true,
      ),
      availableSeats: 2,
      pricePerSeat: 10.0,
      acceptPets: false,
    ),
    Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
        firstName: 'Sovanda',
        lastName: 'Sok',
        email: 'sovanda@example.com',
        phone: '123456789',
        profilePicture: 'https://randomuser.me/api/portraits/men/4.jpg',
        verifiedProfile: true,
      ),
      availableSeats: 1,
      pricePerSeat: 10.0,
      acceptPets: false,
    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides.where((ride) {
      final matchesPreference =
          ride.departureLocation == preference.departure &&
              ride.arrivalLocation == preference.arrival;
      final matchesFilter =
          filter == null || ride.acceptPets == filter.petAccepted;
      return matchesPreference && matchesFilter;
    }).toList();
  }
}
