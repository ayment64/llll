part of 'profile_submitting_bloc.dart';

abstract class ProfileSubmittingEvent extends Equatable {
  ProfileSubmittingEvent([List props = const <dynamic>[]]) : super(props);
}

class GetProfile extends ProfileSubmittingEvent {
  final String token;
  final bool fromHome;

  GetProfile({@required this.token, @required this.fromHome});
}

class EditProfile extends ProfileSubmittingEvent {
  final String token;
  final Profile profileData;

  EditProfile({@required this.profileData, @required this.token});
}
