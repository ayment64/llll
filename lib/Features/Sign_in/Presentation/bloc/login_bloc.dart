import 'dart:async';
import 'package:llll/Core/Presentation_logic/Utils/Input_checker.dart';
import 'package:llll/Core/Presentation_logic/Utils/register_input_cheker.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Domain/UseCaces/Login.dart';
part 'login_event.dart';
part 'login_state.dart';

const String USERNAME_INPUT_FAILURE = "The username can't be empty ";
const String EMAIL_INPUT_FAILURE = 'please enter a valid email';
const String PASSWORD_INPUT_FAILURE = 'The password should be 6 or more charec';
const String PASSWORD_CONFIRMATION_INPUT_FAILURE =
    "This field should should match the password";
const String DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD =
    'Username and password are out of syntax';
const String DOUBLE_INPUT_FAILURE_USERNAME_EMAIL =
    'Username and email are out of syntax';
const String DOUBLE_INPUT_FAILURE_PASSWORD_EMAIL =
    'Password and email are out of syntax';
const String All_INPUT_INPUT_FAILURE =
    'Username and password and email are out of syntax';
const String SERVER_FAILURE_MESSAGE =
    'Server failure it will be up in a minute ';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final Register register;
  final InputChecker inputChecker;
  final RegisterInputChecker registerInputChecker;

  LoginBloc(
      {@required this.login,
      @required this.inputChecker,
      @required this.registerInputChecker,
      @required this.register})
      : assert(login != null),
        assert(inputChecker != null);
  @override
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Signin) {
      yield Loading();
      final params = Params(username: event.username, password: event.password);
      if (event.username == null) {
        yield Error(
            message: EMAIL_INPUT_FAILURE,
            confirmPassword: null,
            password: event.password,
            username: null,
            email: null);
      } else if (emailChecker(event.username) == false ||
          event.username.length > 255) {
        yield Error(
            message: EMAIL_INPUT_FAILURE,
            confirmPassword: null,
            password: event.password,
            username: event.username,
            email: null);
      } else if (event.password == null) {
        yield Error(
            message: PASSWORD_INPUT_FAILURE,
            confirmPassword: null,
            password: null,
            username: event.username,
            email: null);
      } else if (event.password.length < 6 || event.password.length > 255) {
        yield Error(
            message: PASSWORD_INPUT_FAILURE,
            confirmPassword: null,
            password: event.password,
            username: event.username,
            email: null);
      } else {
        yield Loading();
        final failureOrToken = await login(params);
        yield* failureOrToken.fold((failure) async* {
          yield Error(
              message: SERVER_FAILURE_MESSAGE,
              confirmPassword: null,
              password: event.password,
              username: event.username,
              email: null);
        }, (token) async* {
          if (token == "Login isues") {
            yield Error(
                message: token,
                confirmPassword: null,
                password: event.password,
                username: event.username,
                email: null);
          } else {
            yield Loaded(token: token);
          }
        });
      }
    } else if (event is GotoSignup) {
      yield EmptySignUpDisplay();
    } else if (event is SignUp) {
      yield Loading();
      final params = Paramsre(
          email: event.email,
          passwordconfirmation: event.confirmPassword,
          username: event.username,
          password: event.password);

      if (event.username == null) {
        yield SignUpError(
          message: USERNAME_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: false,
          passwordErrorVisibility: false,
          usernameErrorVisibility: true,
          serverErrorVisibility: false,
        );
      } else if (event.username.length > 255) {
        yield SignUpError(
          message: USERNAME_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: false,
          passwordErrorVisibility: false,
          usernameErrorVisibility: true,
          serverErrorVisibility: false,
        );
      } else if (event.password == null) {
        yield SignUpError(
          message: PASSWORD_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: false,
          passwordErrorVisibility: true,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else if (event.password.length < 6 || event.password.length > 255) {
        yield SignUpError(
          message: PASSWORD_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: false,
          passwordErrorVisibility: true,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else if (event.confirmPassword == null ||
          event.confirmPassword.length == 0) {
        yield SignUpError(
          message: PASSWORD_CONFIRMATION_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: true,
          emailErrorVisibility: false,
          passwordErrorVisibility: false,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else if (event.confirmPassword != event.password) {
        yield SignUpError(
          message: PASSWORD_CONFIRMATION_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: true,
          emailErrorVisibility: false,
          passwordErrorVisibility: false,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else if (event.email == null || event.email.length == 0) {
        yield SignUpError(
          message: EMAIL_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: true,
          passwordErrorVisibility: false,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else if (emailChecker(event.email)) {
        yield SignUpError(
          message: EMAIL_INPUT_FAILURE,
          confirmPassword: event.confirmPassword,
          password: event.password,
          username: event.username,
          email: event.email,
          confirmPasswordErrorVisibility: false,
          emailErrorVisibility: true,
          passwordErrorVisibility: false,
          usernameErrorVisibility: false,
          serverErrorVisibility: false,
        );
      } else {
        yield Loading();
        final failureOrToken = await register(params);
        yield* failureOrToken.fold((failure) async* {
          yield SignUpError(
            message: SERVER_FAILURE_MESSAGE,
            confirmPassword: event.confirmPassword,
            password: event.password,
            username: event.username,
            email: event.email,
            confirmPasswordErrorVisibility: false,
            emailErrorVisibility: false,
            passwordErrorVisibility: false,
            usernameErrorVisibility: false,
            serverErrorVisibility: true,
          );
        }, (token) async* {
          if (token == "Login isues") {
            yield SignUpError(
              message: SERVER_FAILURE_MESSAGE,
              confirmPassword: event.confirmPassword,
              password: event.password,
              username: event.username,
              email: event.email,
              confirmPasswordErrorVisibility: false,
              emailErrorVisibility: false,
              passwordErrorVisibility: false,
              usernameErrorVisibility: false,
              serverErrorVisibility: true,
            );
          } else {
            yield Loaded(token: token);
          }
        });
      }
    }
  }

  bool emailChecker(String str) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(str);
    return emailValid;
  }
}
