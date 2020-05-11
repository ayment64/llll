part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent();
}

class GetProfile extends HomeEvent {
  final String token;

  GetProfile({@required this.token});
}

class GoToCategorys extends HomeEvent{
  final String token;

  GoToCategorys({@required this.token});

}