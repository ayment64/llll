import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/Sign_in/Data/DataSource/User_remote_data_source.dart';
import 'package:llll/Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';

import 'package:meta/meta.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  var response;
  UserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, String>> login(
      String username, String password) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.login(username, password);
      if (response is String) {
        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register(Paramsre params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.register(params);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
