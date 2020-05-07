import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/Profile_editing.dart';
import 'package:llll/Features/Profile_submitting/Presentation/bloc/profile_submitting_bloc.dart';
import 'package:llll/Injection_container.dart';

class ProfileEditingPage extends StatelessWidget {
  final String token;
  const ProfileEditingPage({Key key,@required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-------------------------------------------------------------------");
    print(token);

    return Scaffold(
      body: BlocProvider(builder: (_)=> sl<ProfileSubmittingBloc>(),child: ProfileEditing(token: token,)),
    );
  }
}
