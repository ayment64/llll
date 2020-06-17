import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Core/widgets/Loaded_widjet.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/Category/Domain/Entities/SubCategoryData.dart';
import 'package:llll/Features/Category/Presentation/bloc/add_category_bloc.dart';

class AddSubCategory extends StatefulWidget {
  final String token;
  final int id;
  final String catName;
  final List<SubCategoryData> listOfCategorys;

  AddSubCategory({
    Key key,
    @required this.token,
    this.id,
    this.catName,
    this.listOfCategorys,
  }) : super(key: key);

  @override
  _AddSubCategoryState createState() => _AddSubCategoryState();
}

class _AddSubCategoryState extends State<AddSubCategory> {
  String token;
  bool visload = true;
  List<SubCategoryData> listOfCategorys = new List();
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    listOfCategorys = widget.listOfCategorys;
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, new ToAddCategory(token));
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
                    height: 40,
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
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: new Text(
                'Choose Sub category of ' + widget.catName,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: new ListView.builder(
              itemBuilder: (_, int index) => SubCategoryItem(
                data: listOfCategorys[index],
                token: token,
              ),
              itemCount: this.listOfCategorys.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SubCategoryItem extends StatefulWidget {
  final SubCategoryData data;
  final String token;
  SubCategoryItem({this.data, this.token});

  @override
  _SubCategoryItemState createState() => _SubCategoryItemState();
}

class _SubCategoryItemState extends State<SubCategoryItem> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 1.0,
      child: new Container(
        child: new Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
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
                    checkBoxValue = newValue;
                  });
                })
          ],
        ),
      ),
    );
  }
}
