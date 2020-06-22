import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/widgets/Loaded_widjet.dart';
import 'package:llll/Features/Category/Presentation/Widgets/Add_category.dart';
import 'package:llll/Features/Category/Presentation/Widgets/Add_sub_category.dart';
import 'package:llll/Features/Category/Presentation/bloc/add_category_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';

class Category extends StatefulWidget {
  final String token;
  final String from;
 final Location location;
  const Category({Key key, this.token, this.from, this.location}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String token;
  int id;
  String catName;
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    dispatchInitListCatagorys();
    print(
        "**************************************************************************");

    print(token);
    print(
        "**************************************************************************");
    return Container(
      color: Colors.white,
      child: BlocBuilder<AddCategoryBloc, AddCategoryState>(
          builder: (context, state) {
        print(state.toString());
        if (state is ChooseSubcat) {
          id = state.id;
          catName = state.catName;
          dispatchInitListSubCatagorys();
          return LodaedWidgetDisplay();
        } else if (state is SubCatLoaded) {
          return AddSubCategory(
            location: state.location,
            token: state.token,
            catName: state.catName,
            id: state.id,
            listOfCategorys: state.list,
          );
        }
        if (state is SubCatLoading) {
          return LodaedWidgetDisplay();
        }

        if (state is AddCategoryInitial)
          return AddCategory(
            location: widget.location,
            token: token,
          );
      }),
    );
  }

  void dispatchInitListCatagorys() {
    BlocProvider.of<AddCategoryBloc>(context)
        .dispatch(InitListCatagorys(token: token));
  }

  void dispatchInitListSubCatagorys() {
    BlocProvider.of<AddCategoryBloc>(context)
        .dispatch(InitListSubCatagorys(token: token, id: id, catName: catName,location: widget.location));
  }
}
