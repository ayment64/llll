import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Profile_editing.dart';

abstract class ProfileRemaoteDataSourse  {
  ///calls the http://dev.aroundorder.com/api/user/editProfil
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<String> profileEdite(ProfileParams profileParams);
}