import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/Repositories/Location_repository.dart';
import 'package:meta/meta.dart';
class AddLocation implements Usescases<String, LocationParams> {
  final LocationRepository locationRepository;

  AddLocation({@required this.locationRepository});

  @override
  Future<Either<Failure, String>> call(LocationParams params) async {
    return await locationRepository.addLocation(params);
  }
}

class LocationParams {
 final Location location;
 final String token;

  LocationParams({@required this.location,@required this.token});
}
