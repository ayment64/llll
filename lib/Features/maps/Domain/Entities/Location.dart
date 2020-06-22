import 'package:meta/meta.dart';

class Location {
  final int id;
  final String quant;
  final String km;
  final String city;
  final String lat;
  final String long;
  final String zipcode;
  final int isActive;

  Location(
      {@required this.id,
      @required this.zipcode,
      @required this.isActive,
      @required this.quant,
      @required this.km,
      @required this.city,
      @required this.lat,
      @required this.long});
      @override 
      String toString() {
    return '{$zipcode} {$quant} {$city}';
  }
}
