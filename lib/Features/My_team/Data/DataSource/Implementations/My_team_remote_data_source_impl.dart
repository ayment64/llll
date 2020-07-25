import 'dart:convert';

import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/SendInvite.dart';
import 'package:llll/Features/Profile_submitting/Data/Models/Profile_model.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:meta/meta.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:http/http.dart' as http;

import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';

import '../My_team_remote_data_source.dart';

class MyTeamRemoteDataSourceImpl implements MyTeamRemoteDataSource {
  final http.Client client;

  MyTeamRemoteDataSourceImpl({@required this.client});
  @override
  Future<Profile> findUser(FindUserParams params) async {
    String token = params.token;
    final response =
        await http.post("http://dev.aroundorder.com/api/user/findUser",
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
              'Accept': 'application/json'
            },
            body: json.encode({'accountNumber': params.accountNumber}));
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      Profile profile = ProfileModel.fromFindUserJson(responseJson);
      print("_-_-_-_--_-_-_--_-_-_-_" + profile.firstname);
      return profile;
    } else if (response.statusCode == 401) {
      throw NoSuchUserExeption();
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Profile> getPartnerDocuments(GetTeamParams params) {
    // TODO: implement getPartnerDocuments
    throw UnimplementedError();
  }

  @override
  Future<Profile> getPartnerProfile(GetTeamParams params) {
    // TODO: implement getPartnerProfile
    throw UnimplementedError();
  }

  @override
  Future<List<Profile>> getTeam(GetTeamParams params) async {
    String token = params.token;
    final resopnse =
        await http.get("http://dev.aroundorder.com/api/user/getTeam", headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });
    var decodedresponse = json.decode(resopnse.body);
    List<dynamic> jsonarray = decodedresponse["Team"];
    List<Profile> myteam = List();
    for (Map d in jsonarray) {
      print("______________________________________________");
      print(ProfileModel.fromMyTeamJson(d).companyName);
      print("_____________________________________________");
      myteam.add(ProfileModel.fromMyTeamJson(d));
    }
    return myteam;
  }

  @override
  Future<String> sendInvite(SendInviteParams params) async {
    String token = params.token;
    final response =
        await http.post("http://dev.aroundorder.com/api/user/findUser",
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
              'Accept': 'application/json'
            },
            body: json.encode({'partner_id': params.id}));
    if (response.statusCode == 200) {
      return "mriguel";
    } else if (response.statusCode == 401) {
      throw NoSuchUserExeption();
    } else {
      throw ServerExeption();
    }
  }
}
