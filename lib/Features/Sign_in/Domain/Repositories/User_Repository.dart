import 'package:llll/Core/Error/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';

abstract class UserRepository {
  Future<Either<Failure,String>> login(String username,String password);
  
  Future<Either<Failure,String>> register(Paramsre params);
}