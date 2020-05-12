import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Core/widgets/Loadin_widget.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/ProfileEditingPage.dart';
import 'package:llll/Features/Sign_in/Presentation/Widgets/Errors/Login_widjet_ErrorPassword.dart';
import 'package:llll/Features/Sign_in/Presentation/Widgets/Errors/Login_widjet_ErrorServer.dart';
import 'package:llll/Features/Sign_in/Presentation/Widgets/Errors/Login_widjet_ErrorUsername.dart';
import 'package:llll/Features/Sign_in/Presentation/Widgets/Login_widjet.dart';
import 'package:llll/Features/Sign_in/Presentation/Widgets/Signup_widjet.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:llll/main.dart';

class SignIn extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(90, 40, 90, 110),
          child: Container(
            decoration: BoxDecoration(
                color: colorwhite,
                image: DecorationImage(
                    image: AssetImage('Assets/image1.png'),
                    alignment: Alignment.topCenter)),
          ),
        ),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is Empty) {
              return LoginEmptyDisplay();
            } else if (state is Loading) {
              return LoadingWidgetDisplay();
            } else if (state is Loaded) {
            print(state.token);
              return ProfileEditingPage(token: state.token,fromHome: false,);
            } else if (state is Error) {
              if (state.message == "Login isues") {
                print("././././././././././" + state.message);
                return LoginErrorDisplay(
                  username: state.username,
                  password: state.password,
                );
              } else if (state.message == EMAIL_INPUT_FAILURE) {
                return LoginErrorDisplayUsername(
                  password: state.password,
                  username: state.username,
                );
              } else if (state.message == PASSWORD_INPUT_FAILURE) {
                return LoginErrorDisplayPassword(
                  password: state.password,
                  username: state.username,
                );
              }
              return LoginEmptyDisplay();
            } else if (state is EmptySignUpDisplay) {
              return RegisterEmptyDisplay(
                username: "",
                password: "",
                email: "",
                confirmPassword: "",
                usernameErrorVisibility: false,
                passwordErrorVisibility: false,
                emailErrorVisibility: false,
                confirmPasswordErrorVisibility: false,
                serverErrorVisibility: false,
                firstname: "",
                lastname: "",
                firstnameErrorVisibility: false,
                lastnameErrorVisibility: false,
                message: "",
              );
            } else if (state is SignUpError) {
              return new RegisterEmptyDisplay(
                username: state.username,
                password: state.password,
                email: state.email,
                confirmPassword: state.confirmPassword,
                usernameErrorVisibility: state.usernameErrorVisibility,
                passwordErrorVisibility: state.passwordErrorVisibility,
                emailErrorVisibility: state.emailErrorVisibility,
                confirmPasswordErrorVisibility:
                    state.confirmPasswordErrorVisibility,
                serverErrorVisibility: state.serverErrorVisibility,
                firstname: state.firstname,
                lastname: state.lastname,
                firstnameErrorVisibility: state.firstnameErrorVisibility,
                lastnameErrorVisibility: state.lastnameErrorVisibility,
                message: state.message,
              );
            }
          },
        )
      ],
    );
  }
}
