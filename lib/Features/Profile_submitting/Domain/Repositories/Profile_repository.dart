import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Profile_editing.dart';

abstract class ProfileRepository {
  Future<Either<Failure,String>> profileEdite(ProfileParams params);
  Future<Either<Failure,Profile>> showProfile(String token);


}