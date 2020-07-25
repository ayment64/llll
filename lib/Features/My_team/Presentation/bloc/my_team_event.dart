part of 'my_team_bloc.dart';

abstract class MyTeamEvent extends Equatable {
  MyTeamEvent();
}

class FindUserEvent extends MyTeamEvent {
  final FindUserParams params;

  FindUserEvent({@required this.params});
}
class GetTeamEvent extends MyTeamEvent {
  final GetTeamParams getTeamParams;

  GetTeamEvent({@required this.getTeamParams});
}
class GoToSelectedPartnerProfile extends MyTeamEvent{
  final Profile selected_partner;

  GoToSelectedPartnerProfile({this.selected_partner});

}