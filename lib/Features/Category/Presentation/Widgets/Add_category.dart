import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Core/widgets/Loaded_widjet.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/AssociatecatorSubCattolocation.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Presentation/bloc/add_category_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';

class AddCategory extends StatefulWidget {
  final String token;
  final Location location;
  AddCategory({
    @required this.location,
    Key key,
    @required this.token,
  }) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String token;
  bool visload = true;
  List<CategoryData> listOfCategorys = new List();
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, new ToAssociateCategoryPage(token));
                },
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: new Text('Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'sans-serif-light',
                              color: Colors.black)),
                    )
                  ],
                ),
              )),
          Container(
            child: new Container(
              height: 260.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: new Stack(fit: StackFit.loose, children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  image: new ExactAssetImage(
                                      'Assets/images/as.png'),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 25.0,
                                child: new Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    ]),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: new Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Text(
            'Choose your category',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Visibility(
            child: LodaedWidgetDisplay(),
            visible: visload,
          ),
          BlocListener<AddCategoryBloc, AddCategoryState>(
            listener: (context, state) {
              if (state is Loaded) {
                listOfCategorys = state.list;
                visload = false;
              }
              if (state is Loadingg) {
                setState(() {
                  visload = true;
                });
              }
            },
            child: Expanded(
              child: new ListView.builder(
                itemBuilder: (_, int index) => CategoryItem(
                  location: widget.location,
                  data: listOfCategorys[index],
                  token: token,
                ),
                itemCount: this.listOfCategorys.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchInitListCatagorys() {
    BlocProvider.of<AddCategoryBloc>(context)
        .dispatch(InitListCatagorys(token: token));
  }
}

class CategoryItem extends StatefulWidget {
  final CategoryData data;
  final Location location;
  final String token;
  CategoryItem({this.data, this.token, this.location});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 1.0,
      child: new Container(
        child: new Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                dispatchGotoChooseSubcat();
              },
              child: new Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: new Text(
                      widget.data.name,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  )),
            ),
            Checkbox(
                value: checkBoxValue,
                activeColor: Colors.green,
                onChanged: (bool newValue) {
                  setState(() {
                    if (!checkBoxValue) {
                      checkBoxValue = newValue;
                      dispatchGotoChooseAssociation();
                    }
                  });
                })
          ],
        ),
      ),
    );
  }

  void dispatchGotoChooseSubcat() {
    BlocProvider.of<AddCategoryBloc>(context).dispatch(GotoChooseSubcat(
      token: widget.token,
      catName: widget.data.name,
      id: widget.data.id,
      location: widget.location,
    ));
  }

  void dispatchGotoChooseAssociation() {
    AssociatecatorSubCattolocationParams params =
        AssociatecatorSubCattolocationParams(
      active_cat: true,
      catid: widget.data.id,
      subcatid: null,
      location_id: widget.location.id,
      token: widget.token,
    );
    BlocProvider.of<AddCategoryBloc>(context)
        .dispatch(AssociateCatOrSubcattolocationEvnet(params: params));
  }
}
