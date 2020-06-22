import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/AssociateCategory/Presentation/Widgets/Associate_location_to_cat_or_sub.dart';
import 'package:llll/Features/AssociateCategory/Presentation/Widgets/Show_places_List.dart';
import 'package:llll/Features/AssociateCategory/Presentation/bloc/associate_category_bloc.dart';

class AssociateCategory extends StatefulWidget {
  final String token;
  final String from;

  const AssociateCategory({Key key, this.token, this.from}) : super(key: key);

  @override
  _AssociateCategoryState createState() => _AssociateCategoryState();
}

class _AssociateCategoryState extends State<AssociateCategory> {
  String token;
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    print(
        "**************************************************************************");
    print(token);
    token = widget.token;
    return Container(
      color: Colors.white,
      child: BlocBuilder<AssociateCategoryBloc, AssociateCategoryState>(
          builder: (context, state) {
        if (state is AssociateCategoryInitial) dispatchInitListPlaces();
        if (state is LoadedCategoryLocation)
          return AssociateLocationToCatOrSub(
              token: token, list: state.list, location: state.location);
        return Container(
          child: ShowPlacesList(token: token),
        );
      }),
    );
  }

  void dispatchInitListPlaces() {
    BlocProvider.of<AssociateCategoryBloc>(context)
        .dispatch(InitListPlaces(token: token));
  }
}
