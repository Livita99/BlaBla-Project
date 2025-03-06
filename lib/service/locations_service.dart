import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/locations_repository.dart';
import 'package:week_3_blabla_project/repository/mock/mock_locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  final LocationsRepository repository;

  // Private constructor
  LocationsService._internal(this.repository);

  // Singleton instance
  static final LocationsService _instance =
      LocationsService._internal(MockLocationsRepository());

  // Static getter to access the singleton instance
  static LocationsService get instance => _instance;

  // LocationsService(this.repository);

  List<Location> get availableLocations => repository.getLocations();
}
