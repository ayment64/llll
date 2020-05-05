import 'package:flutter/material.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';

import '../../../../main.dart';

class CompanyInfo extends StatefulWidget {
  CompanyInfo({Key key}) : super(key: key);

  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(2, 150, 2, 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: colordarkblue,
            blurRadius: 2.0,
            spreadRadius: 1.0,
          )
        ], borderRadius: BorderRadius.circular(20), color: colorwhite),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 35, 20, 5),
                child: Container(
                  color: colorwhite,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company Name',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Center(
                      child: Text(
                    USERNAME_INPUT_FAILURE,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                visible: false,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  color: colorwhite,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Company Email',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Center(
                      child: Text(
                    USERNAME_INPUT_FAILURE,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                visible: false,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  color: colorwhite,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Center(
                      child: Text(
                    USERNAME_INPUT_FAILURE,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                visible: false,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  color: colorwhite,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Phone Number',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Center(
                      child: Text(
                    USERNAME_INPUT_FAILURE,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                visible: false,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  color: colorwhite,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adress',
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Center(
                      child: Text(
                    USERNAME_INPUT_FAILURE,
                    style: TextStyle(color: Colors.red),
                  )),
                ),
                visible: false,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Street name',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Street Nnumber',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'State',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Zip Code',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'City',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                        child: Container(
                          color: colorwhite,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Contry',
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Center(
                              child: Text(
                            USERNAME_INPUT_FAILURE,
                            style: TextStyle(color: Colors.red),
                          )),
                        ),
                        visible: false,
                      ),
                    ],
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {}, //since this is only a UI app
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: colorlightblue,
                  elevation: 0,
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ));
  }
}
