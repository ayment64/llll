import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/My_team/Domain/Repositories/My_team_repository.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';

class GetPartnerDocuments implements Usescases<Profile, GetPartnerDocumentsParams> {
  final MyTeamRepository categoryRepositor;

  GetPartnerDocuments({@required this.categoryRepositor});

  @override
  Future<Either<Failure, Profile>> call(GetPartnerDocumentsParams params) async {
    return await categoryRepositor.getPartnerDocuments(params);
  }
}

class GetPartnerDocumentsParams {
  final String token;
  final int id;


  GetPartnerDocumentsParams({this.token,this.id});
}
