import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/Profile_submitting/Domain/Repositories/Profile_repository.dart';

class ShowProfile implements Usescases<Profile, String> {
  final ProfileRepository profileRepository;

  ShowProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(String token) async {
    return await profileRepository.showProfile(token);
  }
  
}

class ProfileParams {}
