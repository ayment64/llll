import 'dart:convert';
import 'package:llll/Core/Error/Exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:llll/Features/maps/Data/Models/Location_model.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:meta/meta.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';
import '../Location_remote_data_source.dart';

class LocationRemoteDataSourceImpl implements LocationRemaoteDataSourse {
  final http.Client client;

  LocationRemoteDataSourceImpl({@required this.client});

  @override
  Future<String> addLocation(LocationParams params) async {
    print("________________________________________________");
    print(params.token);
    print("________________________________________________");
    String token = params.token;
    print(json.encode({
      'km': params.location.km,
      'latitude': params.location.lat,
      'longitude': params.location.long
    }));

    final response = await http.post(
        "http://dev.aroundorder.com/api/user/addPlaces",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode({
          'km': params.location.km,
          'latitude': params.location.lat,
          'longitude': params.location.long
        }));
    if (response.statusCode == 200) {
      return "mriguel";
    } else {
      throw ServerExeption();
    }
  }

 
  @override
  Future<List<Location>> showLocations(String token) async {
    var jsonresponse;
    final response =
        await http.get("http://dev.aroundorder.com/api/user/getPlaces",
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            );
    jsonresponse = json.decode(response.body);
    print(jsonresponse);
    List<dynamic> jsonarray=jsonresponse["places"];
    print(jsonarray);
    List<Location> locationList=[];
    for(Map d in jsonarray)
    {
      print(LocationModel.fromJson(d).toString());
      locationList.add(LocationModel.fromJson(d));
    }
    return locationList;
  }
}
