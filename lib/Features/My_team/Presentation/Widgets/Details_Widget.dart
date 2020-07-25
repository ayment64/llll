import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';

class Details_Widget extends StatelessWidget {
  const Details_Widget({
    Key key,
    @required this.selectedProfile,
    @required this.adress,
    @required this.provision,
    @required this.phone,
    @required this.mobile,
    @required this.website,
  }) : super(key: key);

  final Profile selectedProfile;
  final String adress;
  final String provision;
  final String phone;
  final String mobile;
  final String website;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Full Name : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(selectedProfile.firstname + " " + selectedProfile.lastname),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Adresse : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(adress),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Provision : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 300,
                  child: TextFormField(initialValue: provision))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Telephone : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(phone)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Mobile : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(mobile)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Email : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(selectedProfile.email)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                "website : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(website)
            ],
          ),
        ),
      ],
    );
  }
}
