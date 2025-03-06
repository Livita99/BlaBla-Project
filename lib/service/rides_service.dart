import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';

import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static final RidesService _instance = RidesService._internal();
  static late RidesRepository _repository;

  RidesService._internal();

  static void initialize(RidesRepository repository) {
    _repository = repository;
  }

  factory RidesService() {
    return _instance;
  }

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _repository.getRides(preference, filter);
  }
}

class RidesFilter {
  final bool petAccepted;

  RidesFilter({required this.petAccepted});
}
