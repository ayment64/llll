part of 'add_category_bloc.dart';

@immutable
abstract class AddCategoryEvent extends Equatable {
  AddCategoryEvent([List props = const <dynamic>[]]) : super(props);
}

class InitListCatagorys extends AddCategoryEvent {
  final String token;

  InitListCatagorys({@required this.token});
}

class InitListSubCatagorys extends AddCategoryEvent {
  final String token;
  final int id;
  final String catName;
  final Location location;
  InitListSubCatagorys(
      {@required this.catName, @required this.token, @required this.id,@required this.location});
}

class GotoChooseSubcat extends AddCategoryEvent {
  final String token;
  final int id;
  final String catName;
  final Location location;
  GotoChooseSubcat({this.location, this.token, this.id, this.catName});
}

class AssociateCatOrSubcattolocationEvnet extends AddCategoryEvent{
  final AssociatecatorSubCattolocationParams params;

  AssociateCatOrSubcattolocationEvnet({@required this.params});
}