import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/Profile_submitting/Data/DataSource/Profile_remote_data_source.dart';
import 'package:llll/Features/Profile_submitting/Domain/Repositories/Profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Profile_submitting/Domain/UseCaces/Profile_editing.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';

import 'package:meta/meta.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemaoteDataSourse remoteDataSource;
  final NetworkInfo networkInfo;
  var response;
  ProfileRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, String>> profileEdite(ProfileParams params) {
    // TODO: implement profileEdite
    return null;
  }

  
}
