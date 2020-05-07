part of 'profile_submitting_bloc.dart';

abstract class ProfileSubmittingState extends Equatable {
  ProfileSubmittingState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends ProfileSubmittingState {}

class Loaded extends ProfileSubmittingState {
  final Profile profile;

  Loaded({
    @required this.profile,
  });
}
