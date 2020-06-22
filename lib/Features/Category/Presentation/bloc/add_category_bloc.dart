import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_category.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:meta/meta.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  final InitListCategory initListCategory;
  final InitListSubCategory initListSubCategory;
  final AssociatecatorSubCattolocation associatecatorSubCattolocation;

  AddCategoryBloc({
    @required this.initListCategory,
    @required this.initListSubCategory,
    @required this.associatecatorSubCattolocation,
  });
  @override
  AddCategoryState get initialState => AddCategoryInitial();

  @override
  Stream<AddCategoryState> mapEventToState(
    AddCategoryEvent event,
  ) async* {
    if (event is GotoChooseSubcat) {
      yield ChooseSubcat(
          catName: event.catName,
          id: event.id,
          token: event.token,
          location: event.location);
    }
    if (event is InitListCatagorys) {
      yield Loadingg();
      final failureOrToken = await initListCategory(event.token);
      print("------failureOrToken------" + failureOrToken.toString());
      yield* failureOrToken.fold((failure) async* {}, (token) async* {
        print("hani hneeeeee");
        yield Loaded(list: token);
      });
    }
    if (event is InitListSubCatagorys) {
      yield SubCatLoading();
      SubCatParams params = SubCatParams(id: event.id, token: event.token);
      final failureOrToken = await initListSubCategory(params);
      print("------failureOrToken------" + failureOrToken.toString());
      yield* failureOrToken.fold((failure) async* {}, (token) async* {
        print("hani hneeeeee");
        yield SubCatLoaded(
            catName: event.catName,
            id: event.id,
            list: token,
            token: event.token,
            location: event.location);
      });
    } else if (event is AssociateCatOrSubcattolocationEvnet) {
      await associatecatorSubCattolocation(event.params);
    }
  }
}
