import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/My_team/Presentation/bloc/my_team_bloc.dart';
import 'package:llll/Features/maps/Domain/Entities/Location.dart';

class LocationListPartner extends StatelessWidget {
  const LocationListPartner({
    Key key,
    @required this.token,
  }) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    List<Location> listOfLocations = List();

    return Expanded(
      child: BlocListener<MyTeamBloc, MyTeamState>(
        listener: (context, state) {
          if (state is GotPartnerLocations) {
            setState() {
              listOfLocations = state.locations;
            }
          }
        },
        child: Expanded(
          child: new ListView.builder(
            itemBuilder: (_, int index) => LocationItem(
              data: listOfLocations[index],
              token: token,
            ),
            itemCount: listOfLocations.length,
          ),
        ),
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
              onTap: () {},
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
                  });
                })
          ],
        ),
      ),
    );
  }
}
