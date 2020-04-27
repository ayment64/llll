import 'package:llll/Core/Error/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usescases<Type , Params> {
Future<Either<Failure,Type>> call(Params params);
}