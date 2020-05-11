part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class HomeLoading extends HomeState {}

class HomeInitial extends HomeState {}

class HomeCategory extends HomeState {}

