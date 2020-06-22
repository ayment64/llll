import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:meta/meta.dart';

class LocationModel extends Location {
  LocationModel(
      {@required final quant,
      @required final km,
      @required final city,
      @required final lat,
      @required final id,
      @required final isActive,
      @required final zipcode,
      @required final long})
      : super(
          zipcode: zipcode,
          id: id,
          isActive: isActive,
          city: city,
          long: long,
          lat: lat,
          quant: quant,
          km: km,
        );
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      isActive: json["isActive"],
      zipcode: json["zipCode"],
      city: json["city"],
      km: json["km"].toString(),
      lat: json["latitude"].toString(),
      quant: json["state"],
      long: json["longitude"].toString(),
    );
  }
}
