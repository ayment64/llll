import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Features/home/Presentation/bloc/home_bloc.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key key,
    @required this.token,
  }) : super(key: key);

  final String token;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, new ToProfile(widget.token));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    right: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'Assets/images/avatar.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dispatchGoToCategorys();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    left: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          )),
                                      Text(
                                        "Category",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, new ToProfile(widget.token));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    right: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'Assets/images/Orders.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dispatchGoToCategorys();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    left: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'Assets/images/invoices.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "invoices",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, new ToProfile(widget.token));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    right: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'Assets/images/calendar.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "Calender",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, new ToLogin());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    left: BorderSide(color: Color(0x66333333)),
                                    bottom:
                                        BorderSide(color: Color(0x66333333)),
                                  )),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'Assets/images/logoutpng.png'),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "Log out",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
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

  void dispatchGoToCategorys() {
    BlocProvider.of<HomeBloc>(context)
        .dispatch(GoToCategorys(token: widget.token));
  }
}
