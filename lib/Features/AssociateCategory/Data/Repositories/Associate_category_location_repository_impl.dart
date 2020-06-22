import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/AssociateCategory/Data/DataSource/Associate_category_location_remaote_data_sourse.dart';
import 'package:llll/Features/AssociateCategory/Domain/Repositories/Associate_category_location_repository.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:meta/meta.dart';

class AssociateCategoryLocationRepositoryImpl
    implements AssociateCategoryLocationRepository {
  final AssociateCategoryLocationRemaoteDataSourse remoteDataSource;
  final NetworkInfo networkInfo;
  var response;
  AssociateCategoryLocationRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoryData>>> initListCategoryPartner(
      SubCatParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.initListCategoryPartner(params);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> activatelocation(
      ActivatelocationParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.activatelocation(params);
      return Right(true);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> associatecatorSubCattolocation(
      AssociatecatorSubCattolocationParams params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.associatecatorSubCattolocation(params);
      return Right(true);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
