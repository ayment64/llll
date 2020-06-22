import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Domain/Repositories/Category_repository.dart';
import 'package:meta/meta.dart';

class InitListSubCategory
    implements Usescases<List<SubCategoryData>, SubCatParams> {
  final CategoryRepository categoryRepositor;

  InitListSubCategory({@required this.categoryRepositor});

  @override
  Future<Either<Failure, List<SubCategoryData>>> call(
      SubCatParams params) async {
    return await categoryRepositor.initListSubCategory(params);
  }
}

class SubCatParams {
  final int id;
  final String token;

  SubCatParams({@required this.id, @required this.token});
}
