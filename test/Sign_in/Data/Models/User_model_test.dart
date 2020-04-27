import 'dart:convert';

import 'package:llll/Features/Sign_in/Data/Models/User_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../Fixtures/Fixture_reader.dart';

void main() {
  final tUsermodel = UserModel(
      deviceType: "ios",
      deviceToken: "00000000-54b3-e7c7-0000-000046bffd97",
      deviceId: "654C4DB3-3F68-4969-8ED2-80EA16B46EB0",
      id: 24,
      username: "ayment64",
      usernameCanonical: "ayment64",
      salt: null,
      email: "ayment64@gmail.com",
      emailCanonical: "ayment64@gmail.com",
      password: "xxxxx",
      plainPassword: null,
      lastLogin: null,
      confirmationToken: null,
      roles: [
        "ROLE_USER"
    ],
      accountNonExpired: true,
      accountNonLocked: true,
      credentialsNonExpired: true,
      enabled: false,
      superAdmin: false,
      passwordRequestedAt: null,
      groups: [],
      groupNames: [],
      passwordConfirmation: null);
  test('should be a subcalss of user entity ', () async {
    expect(tUsermodel, isA<UserModel>());
  });
  group('From json', () {
    test('should get correspondent object', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('User.json'));
      final result = UserModel.fromJson(jsonMap);
      expect(result, tUsermodel);

    });
  });
}
