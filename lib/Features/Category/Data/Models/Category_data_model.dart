import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:meta/meta.dart';

class CategoryDataModel extends CategoryData {
  CategoryDataModel(
      {@required int id,
      @required String name,
      @required int nbClick,
      @required int isDeleted,
      @required int isAccepted,
      List<SubCategoryData> subcatlist,
      int partnerCategoeyId})
      : super(
            partnerCategoeyId: partnerCategoeyId,
            isAccepted: isAccepted,
            isDeleted: isDeleted,
            id: id,
            name: name,
            nbClick: nbClick,
            subcatlist: subcatlist);
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      id: json["id"],
      name: json["name"],
      nbClick: json["nbClick"],
      isDeleted: json["isDeleted"],
      isAccepted: json["isAccepted"],
    );
  }
  factory CategoryDataModel.fromJsonPartener(Map<String, dynamic> json) {
    return CategoryDataModel(
      partnerCategoeyId: json["id"],
      id: json["catg"]["id"],
      name: json["catg"]["name"],
      nbClick: json["catg"]["nbClick"],
      isDeleted: json["catg"]["isDeleted"],
      isAccepted: json["catg"]["isAccepted"],
    );
  }
}
