part of 'maps_bloc.dart';

abstract class MapsState extends Equatable {
   MapsState([List props = const <dynamic>[]]) : super(props);

}

class Loading extends MapsState {}
class Empty extends MapsState{}

class Loaded extends MapsState{
   final List<Location> locationList;

  Loaded({@required this.locationList});
}