part of 'associate_category_bloc.dart';

abstract class AssociateCategoryState extends Equatable {
   AssociateCategoryState();
}

class AssociateCategoryInitial extends AssociateCategoryState {
  @override
  List<Object> get props => [];
}
class Loadingg extends AssociateCategoryState {}
class Loaded extends AssociateCategoryState{
  final List<Location> list;

  Loaded({@required this.list});
}
class LoadingCategoryLocation extends AssociateCategoryState {}
class AssociateCategoryLocationEmptyDisplay extends AssociateCategoryState {}
class LoadedCategoryLocation extends AssociateCategoryState{
  final List<CategoryData> list;
 final Location location;
  LoadedCategoryLocation({@required this.list,@required this.location});
}