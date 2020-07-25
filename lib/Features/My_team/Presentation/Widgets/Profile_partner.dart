import 'package:flutter/material.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';

import 'Details_Widget.dart';

class PartnerProfile extends StatefulWidget {
  final Profile selected_partner;
  final String token;
  PartnerProfile({this.token, Key key, this.selected_partner})
      : super(key: key);

  @override
  _PartnerProfileState createState() => _PartnerProfileState();
}

class _PartnerProfileState extends State<PartnerProfile> {
  String token;
  Profile selectedProfile;
  String adress;
  String mobile;
  String phone;
  String website;
  String provision;
  bool details = true;
  bool locations = false;
  bool documents = false;

  @override
  Widget build(BuildContext context) {
    token = widget.token;
    selectedProfile = widget.selected_partner;
    print(selectedProfile.provision);
    if (selectedProfile.provision == null)
      provision = "0";
    else
      provision = selectedProfile.provision;
    if (selectedProfile.adress == null)
      adress = "Not Available";
    else
      adress = selectedProfile.adress;
    if (selectedProfile.phoneNumber == null)
      phone = "Not Available";
    else
      phone = selectedProfile.phoneNumber;
    if (selectedProfile.mobileNumber == null)
      mobile = "Not Available";
    else
      mobile = selectedProfile.mobileNumber;
    if (selectedProfile.caompanyWebsite == null)
      website = "Not Available";
    else
      website = selectedProfile.caompanyWebsite;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, new ToMyTeam(token));
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
                      child: new Text(selectedProfile.companyName,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    details = true;
                    locations = false;
                    documents = false;
                  });
                },
                child: Text("Details"),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    details = false;
                    locations = true;
                    documents = false;
                  });
                },
                child: Text("Locations"),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    details = false;
                    locations = false;
                    documents = true;
                  });
                },
                child: Text("Documents"),
              ),
            ],
          ),
          Visibility(
            visible: details,
            child: Details_Widget(
                selectedProfile: selectedProfile,
                adress: adress,
                provision: provision,
                phone: phone,
                mobile: mobile,
                website: website),
          )
        ],
      ),
    );
  }
}
