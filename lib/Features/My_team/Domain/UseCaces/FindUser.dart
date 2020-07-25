import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';

class FindUser implements Usescases<Profile, FindUserParams> {
  final MyTeamRepository categoryRepositor;

  FindUser({@required this.categoryRepositor});

  @override
  Future<Either<Failure, Profile>> call(FindUserParams params) async {
    return await categoryRepositor.findUser(params);
  }
}

class FindUserParams {
  final String token;
  final String accountNumber;

  FindUserParams({@required this.token, @required this.accountNumber});
}
