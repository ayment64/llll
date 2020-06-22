import 'package:flutter/material.dart';
import 'package:llll/Core/Routing/Routing.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    return new ListView(
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
        Column(
          children: <Widget>[
            new Container(
              height: 190.0,
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
                  )
                ],
              ),
            ),
            new Container(
              color: Color(0xffFFFFFF),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: new Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context, new ToMaps(token));
                              },
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                              'Assets/images/addlocation.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Add Location",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    new ToAssociateCategoryPage(token));
                              },
                              child: Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new ExactAssetImage(
                                              'Assets/images/category.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Add Category",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
