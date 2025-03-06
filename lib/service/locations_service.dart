import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  final LocationsRepository repository;

  LocationsService(this.repository);

  List<Location> get availableLocations => repository.getLocations();
}
