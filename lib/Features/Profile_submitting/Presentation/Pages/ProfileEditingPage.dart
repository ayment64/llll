import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/Profile_editing.dart';
import 'package:llll/Features/Profile_submitting/Presentation/bloc/profile_submitting_bloc.dart';
import 'package:llll/Injection_container.dart';

class ProfileEditingPage extends StatelessWidget {
  const ProfileEditingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(builder: (_)=> sl<ProfileSubmittingBloc>(),child: ProfileEditing()),
    );
  }
}
