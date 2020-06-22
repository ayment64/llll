import 'package:equatable/equatable.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:meta/meta.dart';

class CategoryData extends Equatable {
  final int partnerCategoeyId;
  final int id;
  final String name;
  final int nbClick;
  final int isDeleted;
  final int isAccepted;
  final List<SubCategoryData> subcatlist;

  CategoryData(
      {@required this.id,
      @required this.name,
      @required this.nbClick,
      @required this.isDeleted,
      @required this.isAccepted,
      this.subcatlist,
      this.partnerCategoeyId});
}
