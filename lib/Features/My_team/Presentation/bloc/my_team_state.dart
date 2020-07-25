part of 'my_team_bloc.dart';

abstract class MyTeamState extends Equatable {
  MyTeamState();
}

class MyTeamInitial extends MyTeamState {
  @override
  List<Object> get props => [];
}

class UserFound extends MyTeamState {
  final Profile profile;

  UserFound({@required this.profile});
}

class NoSuchUser extends MyTeamState {}

class GetTeamLoading extends MyTeamState {}

class GetTeamLoaded extends MyTeamState {
  final List<Profile> myTeam;

  GetTeamLoaded({@required this.myTeam});
}
class WentToSelectedPartnerProfile extends MyTeamState{
  final Profile selected_partner;

  WentToSelectedPartnerProfile({this.selected_partner});
}