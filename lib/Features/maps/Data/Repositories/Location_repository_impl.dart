import 'package:llll/Features/maps/Data/DataSource/Location_remote_data_source.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/Repositories/Location_repository.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Add_location.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Exeptions.dart';
import 'package:meta/meta.dart';


class MapRepositoryImpl implements LocationRepository {
  final LocationRemaoteDataSourse remoteDataSource;
  final NetworkInfo networkInfo;
  var response;
  MapRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, String>> addLocation(LocationParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.addLocation(params);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Location>>> showLocation(String token) async {
try {
      networkInfo.isConnected;
      response = await remoteDataSource.showLocations(token);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
