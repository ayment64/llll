import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetPartnerDocuments.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetPartnerProfile.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/SendInvite.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';

abstract class MyTeamRepository {
  Future<Either<Failure, Profile>> findUser(FindUserParams params);
  Future<Either<Failure, String>> sendInvite(SendInviteParams params);
  Future<Either<Failure, List<Profile>>> getTeam(GetTeamParams params);
  Future<Either<Failure, Profile>> getPartnerProfile(
      GetPartnerProfileParams params);
  Future<Either<Failure, Profile>> getPartnerDocuments(
      GetPartnerDocumentsParams params);
}
