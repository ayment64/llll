import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Widgets/Profile_Page.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Widgets/loading_widget.dart';
import 'package:llll/Features/Profile_submitting/Presentation/bloc/profile_submitting_bloc.dart';
import 'package:llll/main.dart';

class ProfileEditing extends StatefulWidget {
  final String token;

  const ProfileEditing({Key key, this.token}) : super(key: key);

  @override
  _ProfileEditingState createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  String token;
  @override
  Widget build(BuildContext context) {
    token = widget.token;
    print("**************************************************************************");
    print(token);
    token = widget.token;
    return Container(
      color: colorlightblue,
      child: BlocBuilder<ProfileSubmittingBloc, ProfileSubmittingState>(
          builder: (context, state) {
        if (state is Loading) {
          dispatchGetProfile();
          return LoadingWidget();
        }
        if(state is Loaded)
        {
          return ProfilePage(token: token,profileData: state.profile,);
        }
        return ProfilePage(token: token,profileData: null,);
      }),
    );
  }

  void dispatchGetProfile() {
    BlocProvider.of<ProfileSubmittingBloc>(context)
        .dispatch(GetProfile(token:token));
  }
}
