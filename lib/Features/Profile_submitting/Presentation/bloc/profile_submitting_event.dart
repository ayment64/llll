part of 'profile_submitting_bloc.dart';

abstract class ProfileSubmittingEvent extends Equatable {
  ProfileSubmittingEvent([List props = const <dynamic>[]]) : super(props);}
  class GetProfile extends ProfileSubmittingEvent {
    final String token;

  GetProfile({@required this.token});
  }