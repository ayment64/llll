import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/Profile_submitting/Domain/Repositories/Profile_repository.dart';
import 'package:meta/meta.dart';

class ProfileEditing implements Usescases<String, ProfileParams> {
  final ProfileRepository profileRepository;

  ProfileEditing(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(ProfileParams params) async {
    return await profileRepository.profileEdite(params);
  }
  
}

class ProfileParams {
 final Profile profileData;
 final String token;

  ProfileParams({@required this.profileData,@required this.token});
}
