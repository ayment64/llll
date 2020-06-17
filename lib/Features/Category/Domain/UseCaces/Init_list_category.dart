import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Repositories/Category_repository.dart';
import 'package:meta/meta.dart';

class InitListCategory implements Usescases<List<CategoryData>, String> {
  final CategoryRepository categoryRepositor;

  InitListCategory({@required this.categoryRepositor});

  @override
  Future<Either<Failure, List<CategoryData>>> call(String params) async {
    return await categoryRepositor.initListCategory(params);
  }
  
}

