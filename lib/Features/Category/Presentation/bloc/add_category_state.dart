part of 'add_category_bloc.dart';

@immutable
abstract class AddCategoryState {}

class AddCategoryInitial extends AddCategoryState {}

class Loadingg extends AddCategoryInitial {}

class ChooseSubcat extends AddCategoryState {
  final String token;
  final int id;
  final String catName;
  final Location location;

  ChooseSubcat({this.token, this.id, this.catName, this.location});
}

class SubCatLoading extends AddCategoryState {}

class Loaded extends AddCategoryInitial {
  final List<CategoryData> list;

  Loaded({@required this.list});
}

class SubCatLoaded extends AddCategoryState {
  final String token;
  final int id;
  final String catName;
  final Location location;
  final List<SubCategoryData> list;

  SubCatLoaded({
    @required this.token,
    @required this.id,
    @required this.catName,
    @required this.list,
    @required this.location,
  });
}

class Error extends AddCategoryState {
  final String message;

  Error({@required this.message});
}
