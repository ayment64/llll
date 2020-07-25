import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/My_team/Presentation/bloc/my_team_bloc.dart';
import 'package:llll/Injection_container.dart';

import 'My_team.dart';

class MyTeamPage extends StatelessWidget {
  final String token;
  final String from;
  const MyTeamPage({Key key, @required this.token, this.from})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(
          builder: (_) => sl<MyTeamBloc>(),
          child: MyTeam(
            token: token,
            from: from,
          )),
    );
  }
}
