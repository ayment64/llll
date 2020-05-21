import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/maps/Presentation/bloc/maps_bloc.dart';
import 'package:llll/Injection_container.dart';
import 'Mapping.dart';

class MapsPage extends StatelessWidget {
  final String token;
  const MapsPage({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(
          builder: (_) => sl<MapsBloc>(), child: Maping(token: token)),
    );
  }
}
