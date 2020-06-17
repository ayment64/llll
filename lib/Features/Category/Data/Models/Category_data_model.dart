import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:meta/meta.dart';

class CategoryDataModel extends CategoryData {
  CategoryDataModel(
      {@required int id,
      @required String name,
      @required int nbClick,
      @required int isDeleted,
      @required int isAccepted})
      : super(
            isAccepted: isAccepted,
            isDeleted: isDeleted,
            id: id,
            name: name,
            nbClick: nbClick);
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      id: json["id"],
      name: json["name"],
      nbClick: json["nbClick"],
      isDeleted: json["isDeleted"],
      isAccepted: json["isAccepted"],
    );
  }
}
