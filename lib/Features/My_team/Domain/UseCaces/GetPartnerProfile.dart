import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';

class GetPartnerProfile implements Usescases<Profile, GetPartnerProfileParams> {
  final MyTeamRepository categoryRepositor;

  GetPartnerProfile({@required this.categoryRepositor});

  @override
  Future<Either<Failure, Profile>> call(GetPartnerProfileParams params) async {
    return await categoryRepositor.getPartnerProfile(params);
  }
}

class GetPartnerProfileParams {
  final String token;
  final int id;


  GetPartnerProfileParams({this.token,this.id});
}
