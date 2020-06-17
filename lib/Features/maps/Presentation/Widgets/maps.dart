import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:meta/meta.dart';
import 'package:llll/Features/maps/Presentation/bloc/maps_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';

class Maps extends StatefulWidget {
  final String token;
  final List<Location> locations;

  const Maps({Key key, @required this.token, @required this.locations})
      : super(key: key);
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<Marker> markers = [];
  List<Circle> circles = [];
  bool filled;
  double km = 2;
  LatLng onlypoint;
  GoogleMapController controller;
  Completer<GoogleMapController> _controller = Completer();

  String token;
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      this.controller = controller;
    });
    if (widget.locations.length > 0) {
      for (Location l in widget.locations) {
        addmarkerinit(LatLng(double.parse(l.lat), double.parse(l.long)));
        km = double.parse(l.km);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    token = widget.token;
    return Stack(
      children: <Widget>[
        GoogleMap(
          onTap: (position) {
            if (onlypoint != null) {
              setState(() {
                markers.removeLast();
                circles.removeLast();
                addmarker(position);
              });
            } else {
              onlypoint = position;
              addmarker(position);
            }
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(48.137154, 11.576124),
            zoom: 11.0,
          ),
          markers: Set.from(markers),
          circles: Set.from(circles),
        ),
          Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(context, new ToCategories(token));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    child: Icon(Icons.save),
                    onPressed: () {
                      if (onlypoint != null) addlocation();
                    },
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      child: Icon(Icons.location_off),
                      onPressed: () {
                        setState(() {
                          if (onlypoint != null) {
                            markers.removeLast();
                            circles.removeLast();
                            onlypoint = null;
                          }
                        });
                      },
                    ),
                  ),
                  visible: onlypoint != null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  addmarker(LatLng point) {
    setState(() {
      addCircle(point);
      markers.add(Marker(
          onDragEnd: (position) {
            setState(() {
              circles.removeLast();
              addCircle(position);
            });
          },
          markerId: MarkerId(point.toString()),
          position: point,
          draggable: true,
          infoWindow: InfoWindow(
            title: 'I am a marker',
          ),
          onTap: () {}));
    });
  }

  addmarkerinit(LatLng point) {
    addCircleinit(point);
    markers.add(Marker(
        onDragEnd: (position) {
          setState(() {
            circles.removeLast();
            addCircle(position);
          });
        },
        markerId: MarkerId(point.toString()),
        position: point,
        draggable: true,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        onTap: () {}));
  }

  addCircleinit(LatLng point) {
    circles.add(Circle(
        circleId: CircleId(point.toString()),
        center: point,
        radius: km * 1000,
        fillColor: Color(0x3329ABE2),
        strokeColor: Color(0x4429ABE2),
        onTap: () {}));
  }

  addCircle(LatLng point) {
    setState(() {
      circles.add(Circle(
          circleId: CircleId(point.toString()),
          center: point,
          radius: 1000,
          fillColor: Color(0x3329ABE2),
          strokeColor: Color(0x4429ABE2),
          onTap: () {}));
    });
  }

  void addlocation() {
    Location location = Location(
        long: onlypoint.longitude.toString(),
        lat: onlypoint.latitude.toString(),
        city: null,
        km: "30",
        quant: null);
    onlypoint = null;

    BlocProvider.of<MapsBloc>(context).dispatch(SaveLocationEvent(
        location: LocationParams(location: location, token: token)));
  }

  void showLcation() {
    BlocProvider.of<MapsBloc>(context).dispatch(GetLocations(token: token));
  }
}
