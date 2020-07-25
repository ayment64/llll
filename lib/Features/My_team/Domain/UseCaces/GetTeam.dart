import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';

class GetTeam implements Usescases<List< Profile>, GetTeamParams> {
  final MyTeamRepository categoryRepositor;

  GetTeam({@required this.categoryRepositor});

  @override
  Future<Either<Failure,List< Profile>>> call(GetTeamParams params) async {
    return await categoryRepositor.getTeam(params);
  }
}

class GetTeamParams {
  final String token;


  GetTeamParams({this.token});
}
