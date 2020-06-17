import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/Category/Data/DataSource/Category_remaote_data_sourse.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Domain/Repositories/Category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:meta/meta.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemaoteDataSourse remoteDataSource;
  final NetworkInfo networkInfo;
  var response;
  CategoryRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, List<CategoryData>>> initListCategory(
      String params) async {
    try {
      networkInfo.isConnected;
      response = await remoteDataSource.initListCategory(params);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryData>>> initListSubCategory(SubCatParams params)async {
       try {
      networkInfo.isConnected;
      response = await remoteDataSource.initListSubCategory(params);
      return Right(response);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
