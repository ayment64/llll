import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Core/widgets/Loaded_widjet.dart';
import 'package:llll/Features/AssociateCategory/Domain/UseCaces/Activate_location.dart';
import 'package:llll/Features/AssociateCategory/Presentation/bloc/associate_category_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class ShowPlacesList extends StatefulWidget {
  final String token;
  ShowPlacesList({
    Key key,
    @required this.token,
  }) : super(key: key);

  @override
  _ShowPlacesListState createState() => _ShowPlacesListState();
}

class _ShowPlacesListState extends State<ShowPlacesList> {
  String token;
  String searchValue;
  Location selectedValue;
  bool visload = true;
  List<Location> listOfCategorys = new List();
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, new ToHome(token));
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
              height: 200.0,
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
          Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: SearchableDropdown(
                items: listOfCategorys.map((item) {
                  return new DropdownMenuItem<Location>(
                      child: Text(item.city + ", " + item.quant), value: item);
                }).toList(),
                value: selectedValue,
                isExpanded: true,
                isCaseSensitiveSearch: true,
                searchHint: new Text(
                  'Select ',
                  style: new TextStyle(fontSize: 20),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    print(selectedValue);
                  });
                },
              )),
          Visibility(
            child: LodaedWidgetDisplay(),
            visible: visload,
          ),
          BlocListener<AssociateCategoryBloc, AssociateCategoryState>(
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
                itemBuilder: (_, int index) => LocationItem(
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
}

class LocationItem extends StatefulWidget {
  final Location data;
  final String token;
  LocationItem({this.data, this.token});

  @override
  _LocationItemState createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  bool checkBoxValue;
  bool initiated = false;
  @override
  Widget build(BuildContext context) {
    if (!initiated) {
      checkBoxValue = widget.data.isActive == 1;
      initiated = true;
    }

    return new Card(
      elevation: 1.0,
      child: new Container(
        child: new Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                dispatchInitListCatagorys();
              },
              child: new Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: new Text(
                      widget.data.city + " " + widget.data.quant,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  )),
            ),
            Checkbox(
                value: checkBoxValue,
                activeColor: Colors.green,
                onChanged: (bool newValue) {
                  setState(() {
                    checkBoxValue = newValue;
                    dispatchActivateLocation();
                  });
                })
          ],
        ),
      ),
    );
  }

  void dispatchInitListCatagorys() {
    BlocProvider.of<AssociateCategoryBloc>(context).dispatch(
        GotoAssociateLocationToCatOrSub(
            token: widget.token, location: widget.data));
  }

  void dispatchActivateLocation() {
    ActivatelocationParams params =
        ActivatelocationParams(widget.token, widget.data.id, checkBoxValue);
    BlocProvider.of<AssociateCategoryBloc>(context)
        .dispatch(ActivatelocationEvent(params: params));
  }
}
