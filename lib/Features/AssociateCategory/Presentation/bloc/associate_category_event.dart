part of 'associate_category_bloc.dart';

abstract class AssociateCategoryEvent extends Equatable {
  AssociateCategoryEvent();
}

class InitListPlaces extends AssociateCategoryEvent {
  final String token;

  InitListPlaces({@required this.token});
}

class GotoAssociateLocationToCatOrSub extends AssociateCategoryEvent {
  final Location location;
  final String token;
  GotoAssociateLocationToCatOrSub({
    @required this.location,
    @required this.token,
  });
}

class ActivatelocationEvent extends AssociateCategoryEvent{
 final ActivatelocationParams params;

  ActivatelocationEvent({this.params});

}