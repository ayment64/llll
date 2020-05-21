import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/home/Presentation/Widgets/Category_widget.dart';
import 'package:llll/Features/home/Presentation/Widgets/homepage_widget.dart';
import 'package:llll/Features/home/Presentation/bloc/home_bloc.dart';

class Home extends StatefulWidget {
  final String token;
  final String from;

  const Home({Key key, this.token, this.from}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (widget.from != "cat") {
          return Container(
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state is HomeCategory) return CategoryWidget(token: token);
              return HomePageWidget(token: token);
            }),
          );
        } else {
          return CategoryWidget(token: token);
        }
      }),
    );
  }
}
