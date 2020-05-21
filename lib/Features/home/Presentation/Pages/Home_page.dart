import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/home/Presentation/bloc/home_bloc.dart';
import 'package:llll/Injection_container.dart';

import 'Home.dart';

class HomePage extends StatelessWidget {
  final String token;
  final String from;
  const HomePage({Key key,@required this.token, this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(builder: (_)=> sl<HomeBloc>(),child: Home(token:token,from: from,)),
    );
  }
}
