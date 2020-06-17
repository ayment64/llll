import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';

abstract class CategoryRepository {
  Future<Either<Failure,List<CategoryData>>> initListCategory(String params);
  Future<Either<Failure,List<SubCategoryData>>> initListSubCategory(SubCatParams params);
}