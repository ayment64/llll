import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Get_Category_location_partner.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/UseCaces/Init_list_sub_category.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:llll/Features/maps/Domain/UseCaces/Show_location.dart';
import 'package:meta/meta.dart';
part 'associate_category_event.dart';
part 'associate_category_state.dart';

class AssociateCategoryBloc
    extends Bloc<AssociateCategoryEvent, AssociateCategoryState> {
  final ShowLocation showLocation;
  final InitListCategoryPartner initListCategoryPartner;
  final Activatelocation activatelocation;

  AssociateCategoryBloc(
      {@required this.showLocation,
      @required this.initListCategoryPartner,
      @required this.activatelocation});
  @override
  AssociateCategoryState get initialState => AssociateCategoryInitial();

  @override
  Stream<AssociateCategoryState> mapEventToState(
    AssociateCategoryEvent event,
  ) async* {
    if (event is InitListPlaces) {
      yield Loadingg();
      final failureOrToken = await showLocation(event.token);
      print("------failureOrToken------" + failureOrToken.toString());
      yield* failureOrToken.fold((failure) async* {}, (token) async* {
        print("hani hneeeeee");
        yield Loaded(list: token);
      });
    } else if (event is GotoAssociateLocationToCatOrSub) {
      yield LoadingCategoryLocation();
      SubCatParams params =
          SubCatParams(id: event.location.id, token: event.token);
      final failureOrToken = await initListCategoryPartner(params);
      print("------failureOrToken------" + failureOrToken.toString());
      yield* failureOrToken.fold((failure) async* {}, (token) async* {
        print("hani hneeeeee");
        yield LoadedCategoryLocation(list: token, location: event.location);
      });
    } else if (event is ActivatelocationEvent) {
      final failureOrToken = await activatelocation(event.params);
    }
  }
}
