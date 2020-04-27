import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String deviceType;
  final String deviceToken;
  final String deviceId;
  final int id;
  final String username;
  final String usernameCanonical;
  final String salt;
  final String email;
  final String emailCanonical;
  final String password;
  final String plainPassword;
  final DateTime lastLogin;
  final String confirmationToken;
  final List roles;
  final bool accountNonExpired;
  final bool accountNonLocked;
  final bool credentialsNonExpired;
  final bool enabled;
  final bool superAdmin;
  final String passwordRequestedAt;
  final List groups;
  final List groupNames;
  final String passwordConfirmation;

  User(
      {
      @required this.id,
      @required this.usernameCanonical,
      @required this.salt,
      @required this.email,
      @required this.emailCanonical,
      @required this.plainPassword,
      @required this.lastLogin,
      @required this.confirmationToken,
      @required this.roles,
      @required this.accountNonExpired,
      @required this.accountNonLocked,
      @required this.credentialsNonExpired,
      @required this.enabled,
      @required this.superAdmin,
      @required this.passwordRequestedAt,
      @required this.groups,
      @required this.groupNames,
      @required this.deviceType,
      @required this.deviceToken,
      @required this.deviceId,
      @required this.username,
      @required this.password,
      @required this.passwordConfirmation})
      : super([username,email]);
}
