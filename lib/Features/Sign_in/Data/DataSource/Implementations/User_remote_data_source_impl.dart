import 'dart:convert';
import 'dart:io';
import 'package:device_id/device_id.dart';
import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Features/Sign_in/Data/DataSource/User_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:meta/meta.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  String deviceType;
  String deviceId;
  String devicetoken;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  UserRemoteDataSourceImpl({@required this.client});
  @override
  Future<String> login(String username, String password) async {
    if (Platform.isAndroid) {
      deviceType = "android";
    } else if (Platform.isIOS) {
      deviceType = "ios";
    }
    deviceId = await DeviceId.getID;
    devicetoken = await firebaseMessaging.getToken();
    final response =
        await client.post("http://dev.aroundorder.com/api/auth/login",
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              "username": username,
              "password": password,
              "device_type": deviceType,
              "device_id": deviceId,
              "device_token": devicetoken
            }));
    if (response.statusCode == 200)
      return getToken(json.decode(response.body));
    else if (response.statusCode == 401) {
      return "Login isues";
    } else {
      throw ServerExeption();
    }
  }
  //

  String getToken(Map<String, dynamic> json) {
    return json['token'];
  }

  String getErrorMessage(Map<String, dynamic> json) {
    return json['message'];
  }

  @override
  Future<String> register(Paramsre params) async {
    if (Platform.isAndroid) {
      deviceType = "android";
    } else if (Platform.isIOS) {
      deviceType = "ios";
    }
    deviceId = await DeviceId.getID;
    devicetoken = await firebaseMessaging.getToken();
    print(json.encode({
      "username": params.email,
      "password": params.password,
      "password_confirmation": params.passwordconfirmation,
      "email": params.email,
      "firstname": params.firstname,
      "lastname": params.lastname,
      "device_type": deviceType,
      "device_id": deviceId,
      "device_token": devicetoken
    }));
    final response =
        await client.post("http://dev.aroundorder.com/api/auth/register",
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              "username": params.email,
              "password": params.password,
              "password_confirmation": params.passwordconfirmation,
              "email": params.email,
              "firstname": params.firstname,
              "lastname": params.lastname,
              "device_type": deviceType,
              "device_id": deviceId,
              "device_token": devicetoken
            }));

    if (response.statusCode == 200) {
      return getToken(json.decode(response.body));
    } else if (response.statusCode==401){
      return "The email provided already has an account!";
    }else {
      throw ServerExeption();
    }
  }
}
