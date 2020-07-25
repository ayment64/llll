import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:meta/meta.dart';

class SendInvite implements Usescases<String, SendInviteParams> {
  final MyTeamRepository categoryRepositor;

  SendInvite({@required this.categoryRepositor});

  @override
  Future<Either<Failure, String>> call(SendInviteParams params) async {
    return await categoryRepositor.sendInvite(params);
  }
}

class SendInviteParams {
  final String token;
  final String id;

  SendInviteParams({@required this.token, @required this.id});
}
