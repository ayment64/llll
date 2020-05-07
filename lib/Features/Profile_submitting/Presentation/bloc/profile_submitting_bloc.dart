import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Show_profile.dart';
import 'package:meta/meta.dart';

part 'profile_submitting_event.dart';
part 'profile_submitting_state.dart';

class ProfileSubmittingBloc
    extends Bloc<ProfileSubmittingEvent, ProfileSubmittingState> {
  final ShowProfile showProfile;

  ProfileSubmittingBloc({@required this.showProfile});
  @override
  ProfileSubmittingState get initialState => Loading();

  @override
  Stream<ProfileSubmittingState> mapEventToState(
    ProfileSubmittingEvent event,
  ) async* {
    if (event is GetProfile) {
      yield Loading();
      final failureOrToken = await showProfile(event.token);
      print("------failureOrToken------" + failureOrToken.toString());
      yield* failureOrToken.fold((failure) async* {
        print("unexpected error");
      }, (profile) async* {
        yield Loaded(
            profile: profile,
       );
      });
    }
  }
}
