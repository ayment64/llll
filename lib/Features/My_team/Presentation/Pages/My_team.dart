import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/My_team/Presentation/Widgets/My_team_widget.dart';
import 'package:llll/Features/My_team/Presentation/Widgets/Profile_partner.dart';
import 'package:llll/Features/My_team/Presentation/bloc/my_team_bloc.dart';

class MyTeam extends StatefulWidget {
  final String token;
  final String from;

  const MyTeam({Key key, this.token, this.from}) : super(key: key);

  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  String token;
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    print(
        "**************************************************************************");
    print(token);
    token = widget.token;
    return Container(
      color: Colors.white,
      child: BlocBuilder<MyTeamBloc, MyTeamState>(builder: (context, state) {
        if (state is WentToSelectedPartnerProfile) {
          return PartnerProfile(
            selected_partner: state.selected_partner,
            token: token,
          );
        }
        return MyteamWidget(token: token);
      }),
    );
  }
}
