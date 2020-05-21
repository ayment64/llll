import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';
abstract class LocationRemaoteDataSourse {
  ///calls the http://dev.aroundorder.com/api/user/addPlaces
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<String> addLocation(LocationParams params);

  ///calls the http://dev.aroundorder.com/api/user/getPlaces
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<List<Location>> showLocations(String token);
}
