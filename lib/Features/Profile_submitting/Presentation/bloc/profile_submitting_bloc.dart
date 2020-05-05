import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_submitting_event.dart';
part 'profile_submitting_state.dart';

class ProfileSubmittingBloc extends Bloc<ProfileSubmittingEvent, ProfileSubmittingState> {
  @override
  ProfileSubmittingState get initialState => ProfileSubmittingInitial();

  @override
  Stream<ProfileSubmittingState> mapEventToState(
    ProfileSubmittingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
