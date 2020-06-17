import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';

abstract class CategoryRemaoteDataSourse {
  Future<List<CategoryData>> initListCategory(String token);
  Future<List<SubCategoryData>> initListSubCategory(SubCatParams token);
}
