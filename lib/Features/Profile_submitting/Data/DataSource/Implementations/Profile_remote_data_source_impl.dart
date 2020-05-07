import 'dart:convert';
import 'package:llll/Core/Error/Exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:llll/Features/Profile_submitting/Data/Models/Profile_model.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Profile_editing.dart';
import 'package:meta/meta.dart';

import '../Profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemaoteDataSourse {
  final http.Client client;

  ProfileRemoteDataSourceImpl({@required this.client});
  @override
  @override
  Future<Profile> showEdite(String token) async {
    print("________________________________________________");
    print(token);

    final response = await http.get(
      "http://dev.aroundorder.com/api/user/getProfil",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      Profile profile = ProfileModel.fromJson(responseJson);
      print("_-_-_-_--_-_-_--_-_-_-_"+profile.firstname);
      return profile;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<String> profileEdite(ProfileParams profileParams) {
    // TODO: implement showEdite
    return null;
  }
}
