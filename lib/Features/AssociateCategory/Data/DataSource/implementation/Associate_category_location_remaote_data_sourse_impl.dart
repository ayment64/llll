import 'dart:convert';

import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Data/Models/Category_data_model.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:http/http.dart' as http;
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:meta/meta.dart';

import '../Associate_category_location_remaote_data_sourse.dart';

class AssociateCategoryLocationRemaoteDataSourseImpl
    implements AssociateCategoryLocationRemaoteDataSourse {
  final http.Client client;

  AssociateCategoryLocationRemaoteDataSourseImpl({@required this.client});

  @override
  Future<List<CategoryData>> initListCategoryPartner(SubCatParams token) async {
    var response;
    String tokken = token.token;
    response =
        await http.post("http://dev.aroundorder.com/api/user/getLocationcat",
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $tokken',
            },
            body: json.encode({"location_id": token.id}));
    var jsonresponse = json.decode(response.body);
    print("________________________________________________");
    print(token);
    print("________________________________________________");
    List<dynamic> jsonarray = jsonresponse["list of category"];
    print(jsonarray);
    List<CategoryData> categoryList = [];
    for (Map d in jsonarray) {
      print(CategoryDataModel.fromJson(d).toString());
      categoryList.add(CategoryDataModel.fromJsonPartener(d));
    }
    return categoryList;
  }

  @override
  Future<bool> activatelocation(ActivatelocationParams params) async {
    String token = params.token;
    final response = await http.post(
        "http://dev.aroundorder.com/api/user/activateLocation",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "location_id_active": params.id,
          "is_active_location": params.isactive
        }));
    print(response);
    return response.statusCode == 200;
  }

  @override
  Future<bool> associatecatorSubCattolocation(
      AssociatecatorSubCattolocationParams params) async {
    String token = params.token;
    final response = await http.post(
        "http://dev.aroundorder.com/api/user/associateLocations",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "sub_cat": params.subcatid,
          "main_cat": params.catid,
          "id_location": params.location_id,
          "active_cat": params.active_cat
        }));
    print(json.decode(response.body));
    return response.statusCode == 200;
  }
}
