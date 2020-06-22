import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Features/Category/Domain/Entities/CategoryData.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';

class AssociateLocationToCatOrSub extends StatefulWidget {
  final String token;
  final Location location;
  final List<CategoryData> list;
  AssociateLocationToCatOrSub(
      {Key key,
      @required this.token,
      @required this.list,
      @required this.location})
      : super(key: key);

  @override
  _AssociateLocationToCatOrSubState createState() =>
      _AssociateLocationToCatOrSubState();
}

class _AssociateLocationToCatOrSubState
    extends State<AssociateLocationToCatOrSub> {
  String token;
  String searchValue;
  Location location;
  bool visload = true;
  List<CategoryData> listOfCategorys = new List();
  @override
  Widget build(BuildContext context) {
    location = widget.location;
    listOfCategorys = widget.list;
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
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: new TextFormField(
              initialValue: "",
              onChanged: (value) {
                searchValue = value;
              },
              style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  labelStyle: TextStyle(fontSize: 15)),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: new AutoSizeText(
                    "City/Country",
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: new AutoSizeText(
                    "Zip Code",
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: new AutoSizeText(
                    location.city + " " + location.quant,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.8,
                  child: new AutoSizeText(
                    location.zipcode,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 36.0,
                  ),
                  onPressed: () {
                    Navigator.push(context, new ToAddCategory(token,widget.location));
                  })
            ],
          ),
          Expanded(
            child: new ListView.builder(
              itemBuilder: (_, int index) => CategoryItem(
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

class CategoryItem extends StatefulWidget {
  final CategoryData data;
  final String token;
  CategoryItem({this.data, this.token});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool checkBoxValue = true;
  String dataname = "no items available";

  @override
  Widget build(BuildContext context) {
    if(widget.data.name!=null)
    dataname = widget.data.name;
    
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
                     dataname,
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
