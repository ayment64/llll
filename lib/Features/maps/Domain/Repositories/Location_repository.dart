import 'package:llll/Core/Error/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';

abstract class LocationRepository {
  Future<Either<Failure,List<Location>>> showLocation(String token);
  
  Future<Either<Failure,String>> addLocation(LocationParams params);
}