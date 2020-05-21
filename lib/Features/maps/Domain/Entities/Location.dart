import 'package:meta/meta.dart';

class Location {
  final String quant;
  final String km;
  final String city;
  final String lat;
  final String long;

  Location(
      {@required this.quant,
      @required this.km,
      @required this.city,
      @required this.lat,
      @required this.long});
}
