import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';

abstract class AssociateCategoryLocationRepository {
  Future<Either<Failure, List<CategoryData>>> initListCategoryPartner(
      SubCatParams params);
  Future<Either<Failure, bool>> activatelocation(ActivatelocationParams params);
  Future<Either<Failure, bool>> associatecatorSubCattolocation(
      AssociatecatorSubCattolocationParams params);
}
