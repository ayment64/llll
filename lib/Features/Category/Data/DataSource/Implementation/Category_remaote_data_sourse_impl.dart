import 'dart:convert';

import 'package:llll/Features/Category/Data/Models/Category_data_model.dart';
import 'package:llll/Features/Category/Data/Models/Sub_category_data_model.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:http/http.dart' as http;
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import '../Category_remaote_data_sourse.dart';
import 'package:meta/meta.dart';

class CategoryRemaoteDataSourseimpl implements CategoryRemaoteDataSourse {
  final http.Client client;

  CategoryRemaoteDataSourseimpl({@required this.client});
  @override
  Future<List<CategoryData>> initListCategory(String token) async {
    var response;
    response = await http.get(
      "http://dev.aroundorder.com/api/user/getService",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var jsonresponse = json.decode(response.body);
    print("________________________________________________");
    print(token);
    print("________________________________________________");
    List<dynamic> jsonarray = jsonresponse["category"];
    print(jsonarray);
    List<CategoryData> categoryList = [];
    for (Map d in jsonarray) {
      print(CategoryDataModel.fromJson(d).toString());
      categoryList.add(CategoryDataModel.fromJson(d));
    }
    return categoryList;
  }

  @override
  Future<List<SubCategoryData>> initListSubCategory(SubCatParams token) async {
    var response;
    String tokken = token.token;
    response = await http.post("http://dev.aroundorder.com/api/user/getSubService",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokken',
        },
        body: json.encode({"service_id": token.id}));
    var jsonresponse = json.decode(response.body);
    print("________________________________________________");
    print(token);
    print("________________________________________________");
    List<dynamic> jsonarray = jsonresponse["Subcategory"];
    print(jsonarray);
    List<SubCategoryData> categoryList = [];
    for (Map d in jsonarray) {
      print(CategoryDataModel.fromJson(d).toString());
      categoryList.add(SubCategoryDataModel.fromJson(d));
    }
    return categoryList;
  }
}
