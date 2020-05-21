part of 'maps_bloc.dart';

abstract class MapsEvent extends Equatable {
  MapsEvent([List props = const <dynamic>[]]) : super(props);
}
class SaveLocationEvent extends MapsEvent{
  final LocationParams location;


  SaveLocationEvent({@required this.location});
}
class GetLocations extends MapsEvent{
  final String token;

  GetLocations({@required this.token});
}