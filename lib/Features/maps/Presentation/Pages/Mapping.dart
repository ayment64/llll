import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/maps/Presentation/Widgets/maps.dart';
import 'package:llll/Features/maps/Presentation/bloc/maps_bloc.dart';

class Maping extends StatefulWidget {
  const Maping({Key key,@required this.token}) : super(key: key);
  final String token;

  @override
  _MapingState createState() => _MapingState();
}

class _MapingState extends State<Maping> {
  @override
  Widget build(BuildContext context) {
    showLcation();
    return Container(
      child: BlocBuilder<MapsBloc, MapsState>(
          builder: (context, state) {
            if(state is Loaded)
            return Maps(token: widget.token,locations: state.locationList,);
            /*else return MapsBlanc(token:widget.token);*/
            else return Container();
          })
    );
  }

  void showLcation() {
    BlocProvider.of<MapsBloc>(context).dispatch(GetLocations(token: widget.token));
  }
}