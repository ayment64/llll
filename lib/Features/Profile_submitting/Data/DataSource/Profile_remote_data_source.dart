abstract class ProfileRemaoteDataSourse  {
  ///calls the http://dev.aroundorder.com/api/user/editProfil
  ///
  ///throws[ServerExeptions]for all error codes.
  Future<String> profileEdite(String username, String password);
}
