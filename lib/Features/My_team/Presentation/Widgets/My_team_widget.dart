import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/Core/widgets/Loaded_widjet.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/FindUser.dart';
import 'package:llll/Features/My_team/Domain/UseCaces/GetTeam.dart';
import 'package:llll/Features/My_team/Presentation/bloc/my_team_bloc.dart';
import 'package:llll/Features/Profile_submitting/Domain/Entities/Profile.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class MyteamWidget extends StatefulWidget {
  final String token;

  MyteamWidget({
    Key key,
    @required this.token,
  }) : super(key: key);

  @override
  _MyteamWidgetState createState() => _MyteamWidgetState();
}

class _MyteamWidgetState extends State<MyteamWidget> {
  String token;
  String searchValue = "";
  bool visload = true;
  Profile searchedUser;
  String companyName = "";
  bool gotTeam = false;
  List<Profile> myTeam = List();
  @override
  Widget build(BuildContext context) {
    if (!gotTeam) {
      dispatcheventGetTeam();
      gotTeam = true;
    }
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
              onChanged: (value) {
                searchValue = value;
                dispatcheventFinduser();
              },
              style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  labelStyle: TextStyle(fontSize: 15)),
            ),
          ),
          BlocListener<MyTeamBloc, MyTeamState>(
              listener: (context, state) {
                if (state is UserFound) {
                  searchedUser = state.profile;
                  companyName = searchedUser.companyName;
                }
                if (state is NoSuchUser) {
                  companyName = "";

                  searchedUser = null;
                }
                if (state is GetTeamLoaded) {
                  myTeam = state.myTeam;
                }
              },
              child: Container()),
          Visibility(
            child: LodaedWidgetDisplay(),
            visible: false,
          ),
          Card(
            elevation: 1.0,
            child: Visibility(
              child: Container(
                  child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: new ExactAssetImage('Assets/images/as.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 180,
                      child: Text(companyName)),
                  MaterialButton(
                    onPressed: () {
                      print("invitation sent");
                    },
                    child: Text("invite"),
                  )
                ],
              )),
              visible: searchedUser != null,
            ),
          ),
          Expanded(
            child: new ListView.builder(
              itemBuilder: (_, int index) => MyTeamItem(
                index: index,
                myTeam: myTeam,
                profile: myTeam[index],
              ),
              itemCount: this.myTeam.length,
            ),
          ),
        ],
      ),
    );
  }

  dispatcheventFinduser() {
    FindUserParams params =
        FindUserParams(accountNumber: searchValue, token: token);
    BlocProvider.of<MyTeamBloc>(context)
        .dispatch(FindUserEvent(params: params));
  }

  dispatcheventGetTeam() {
    GetTeamParams getTeamParams = GetTeamParams(token: widget.token);
    BlocProvider.of<MyTeamBloc>(context)
        .dispatch(GetTeamEvent(getTeamParams: getTeamParams));
  }
}

class MyTeamItem extends StatefulWidget {
  MyTeamItem(
      {Key key,
      @required this.profile,
      @required this.myTeam,
      @required this.index})
      : super(key: key);
  final Profile profile;
  final List<Profile> myTeam;
  final int index;

  @override
  _MyTeamItemState createState() => _MyTeamItemState();
}

class _MyTeamItemState extends State<MyTeamItem> {
  String adress = "not available";
  String tel = "not available";
  String companyName = "not available";
  Profile selectedValue;
  @override
  Widget build(BuildContext context) {
    if (widget.profile.adress != null) adress = widget.profile.adress;
    if (widget.profile.phoneNumber != null) tel = widget.profile.phoneNumber;
    if (widget.profile.companyName != null)
      companyName = widget.profile.companyName;
    if (widget.index == 0)
      return Column(
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: SearchableDropdown(
                items: widget.myTeam.map((item) {
                  return new DropdownMenuItem<Profile>(
                      child: Text(item.companyName), value: item);
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
          InkWell(
            onTap: () {
              dispatchEventGotoPartnerProfile(widget.profile);
            },
            child: Card(
              elevation: 2.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Container(
                        width: 55.0,
                        height: 55.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            image: new ExactAssetImage('Assets/images/as.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width - 137,
                            child: Text(companyName,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Container(
                            width: MediaQuery.of(context).size.width - 137,
                            child: Text(adress)),
                        Container(
                            width: MediaQuery.of(context).size.width - 137,
                            child: Text(tel)),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.close), onPressed: null)
                ],
              ),
            ),
          ),
        ],
      );
    else
      return InkWell(
        onTap: () {
          dispatchEventGotoPartnerProfile(widget.profile);
        },
        child: Card(
          elevation: 2.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new ExactAssetImage('Assets/images/as.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width - 137,
                        child: Text(companyName,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                        width: MediaQuery.of(context).size.width - 137,
                        child: Text(adress)),
                    Container(
                        width: MediaQuery.of(context).size.width - 137,
                        child: Text(tel)),
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.close), onPressed: null)
            ],
          ),
        ),
      );
  }

  dispatchEventGotoPartnerProfile(Profile partner) {
    BlocProvider.of<MyTeamBloc>(context)
        .dispatch(GoToSelectedPartnerProfile(selected_partner: partner));
  }
}
