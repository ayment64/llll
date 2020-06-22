import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';

abstract class AssociateCategoryLocationRemaoteDataSourse {
  Future<List<CategoryData>> initListCategoryPartner(SubCatParams token);
  Future<bool> activatelocation(ActivatelocationParams params);
  Future<bool> associatecatorSubCattolocation(
      AssociatecatorSubCattolocationParams params);
}
