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

  InitListSubCatagorys(
      {@required this.catName, @required this.token, @required this.id});
}

class GotoChooseSubcat extends AddCategoryEvent {
  final String token;
  final int id;
  final String catName;

  GotoChooseSubcat({this.token, this.id, this.catName});
}
