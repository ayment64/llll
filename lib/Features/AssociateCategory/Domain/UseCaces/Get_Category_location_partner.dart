import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Usecases/Usecases.dart';
import 'package:llll/Features/AssociateCategory/Domain/Repositories/Associate_category_location_repository.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:meta/meta.dart';

class InitListCategoryPartner implements Usescases<List<CategoryData>, SubCatParams> {
  final AssociateCategoryLocationRepository categoryRepositor;

  InitListCategoryPartner({@required this.categoryRepositor});

  @override
  Future<Either<Failure, List<CategoryData>>> call(SubCatParams params) async {
    return await categoryRepositor.initListCategoryPartner(params);
  }
  
}

