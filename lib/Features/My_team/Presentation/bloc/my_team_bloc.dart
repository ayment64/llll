import 'dart:async';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/Get_partner_locations.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';

part 'my_team_event.dart';
part 'my_team_state.dart';

class MyTeamBloc extends Bloc<MyTeamEvent, MyTeamState> {
  final FindUser findUser;
  final GetTeam getTeam;
  final GetPartnerLocations getPartnerLocations;
  MyTeamBloc(
      {@required this.findUser,
      @required this.getTeam,
      @required this.getPartnerLocations});
  @override
  MyTeamState get initialState => MyTeamInitial();

  @override
  Stream<MyTeamState> mapEventToState(
    MyTeamEvent event,
  ) async* {
    if (event is FindUserEvent) {
      var failureorprofile = await findUser(event.params);
      yield* failureorprofile.fold((failure) async* {
        print('no user found by this account number');
        yield NoSuchUser();
      }, (profile) async* {
        yield UserFound(profile: profile);
      });
    }
    if (event is GetTeamEvent) {
      var failureorprofile = await getTeam(event.getTeamParams);
      yield* failureorprofile.fold((failure) async* {
        print('no user found by this account number');
        yield NoSuchUser();
      }, (myteam) async* {
        yield GetTeamLoaded(myTeam: myteam);
      });
    }
    if (event is GoToSelectedPartnerProfile) {
      yield WentToSelectedPartnerProfile(
          selected_partner: event.selected_partner);
    }
    if (event is GettPartnerLocations) {
      yield GettingPartnerLocations();
      var failureorLocations = await getPartnerLocations(event.params);
      yield* failureorLocations.fold((failure) async* {
        print("failure nikomek");
      }, (locations) async* {
        yield GotPartnerLocations(locations: locations);
      });
    }
  }
}
