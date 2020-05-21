import 'dart:async';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Show_location.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';
part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  final AddLocation addLocation;
  final ShowLocation showLocation;
  MapsBloc({@required this.showLocation, @required this.addLocation});

  @override
  MapsState get initialState => Empty();

  @override
  Stream<MapsState> mapEventToState(
    MapsEvent event,
  ) async* {
    if (event is SaveLocationEvent) {
      yield Loading();
      final failureortoken = await addLocation(event.location);
      yield* failureortoken.fold((failure) async* {
        print("unexpected error");
      }, (token) async* {
        GetLocations(token:event.location.token);
      });
    }else if (event is GetLocations)
    {
       yield Loading();
      final failureortoken = await showLocation(event.token);
      yield* failureortoken.fold((failure) async* {
        print("unexpected error");
      }, (token) async* {
        yield Loaded(locationList: token);
      });
    }
  }
}
