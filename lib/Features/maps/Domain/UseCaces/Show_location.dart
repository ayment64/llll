import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/Repositories/Location_repository.dart';
import 'package:meta/meta.dart';
class ShowLocation implements Usescases<List<Location>, String> {
  final LocationRepository locationRepository;
  ShowLocation({@required this.locationRepository});

  @override
  Future<Either<Failure, List<Location>>> call(String params) async {
    return await locationRepository.showLocation(params);
  }
}

