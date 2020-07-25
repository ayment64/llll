import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/SendInvite.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';

abstract class MyTeamRemoteDataSource {
  ///calls the http://dev.aroundorder.com/api/user/findUser
  //?/Post request
  ///throws[ServerExeptions]for all error codes.
  Future<Profile> findUser(FindUserParams params);

  ///calls the http://dev.aroundorder.com/api/user/getTeam
  //?/Get request
  ///throws[ServerExeptions]for all error codes.
  Future<List<Profile>> getTeam(GetTeamParams params);

  ///calls the http://dev.aroundorder.com/api/user/getTeamprofile
  //?/Post request
  ///throws[ServerExeptions]for all error codes.
  Future<Profile> getPartnerProfile(GetTeamParams params);

  ///calls the http://dev.aroundorder.com/api/user/getTeamdocument
  //?/Post request
  ///throws[ServerExeptions]for all error codes.
  Future<Profile> getPartnerDocuments(GetTeamParams params);

  ///calls the http://dev.aroundorder.com/api/user/sendInvi
  //?/Post request
  ///throws[ServerExeptions]for all error codes.
  Future<String> sendInvite(SendInviteParams params);
  
}
