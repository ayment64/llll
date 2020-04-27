import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';

abstract class UserRemoteDataSource {
  ///calls the  http://dev.aroundorder.com/api/auth/login
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<String> login(String username, String password);
  ///calls the  http://dev.aroundorder.com/api/auth/register
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<String> register(Paramsre params);
  
  
}
