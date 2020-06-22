import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:meta/meta.dart';

class SubCategoryDataModel extends SubCategoryData {
  SubCategoryDataModel({
    @required int id,
    @required String name,
    @required int isDeleted,
  }) : super(
          isDeleted: isDeleted,
          id: id,
          name: name,
        );
  factory SubCategoryDataModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryDataModel(
      id: json["id"],
      name: json["name"],
      isDeleted: json["isDeleted"],
    );
  }
}
