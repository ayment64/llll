import 'dart:async';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Presentation_logic/Utils/Input_checker.dart';
import 'package:llll/Core/Presentation_logic/Utils/register_input_cheker.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Domain/UseCaces/Login.dart';
part 'login_event.dart';
part 'login_state.dart';

const String USERNAME_INPUT_FAILURE =
    'The username should be 255 or less caracters ';
const String PASSWORD_INPUT_FAILURE = 'The password should be 6 or more charec';
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
      final params = Params(username: event.username, password: event.password);
      final reponse = inputChecker(params);

      yield* reponse.fold((failure) async* {
        if (failure is DoubleFailure) {
          yield Error(message: DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD);
        } else if (failure is UsernameInputFailure) {
          yield Error(message: USERNAME_INPUT_FAILURE);
        } else if (failure is PasswordInputFailure) {
          yield Error(message: PASSWORD_INPUT_FAILURE);
        }
      }, (string) async* {
        yield Loading();
        final failureOrToken = await login(params);
        yield* failureOrToken.fold((failure) async* {
          yield Error(message: SERVER_FAILURE_MESSAGE);
        }, (token) async* {
          if (token == "Login isues") {
            yield Error(message: token);
          } else {
            yield Loaded(token: token);
          }
        });
      });
    } else if (event is GotoSignup) {
      yield EmptySignUpDisplay();
    } else if (event is SignUp) {
      final params = Paramsre(
          email: event.email,
          passwordconfirmation: event.confirmPassword,
          username: event.username,
          password: event.password);
      final reponse = registerInputChecker(params);

      yield* reponse.fold((failure) async* {
        if (failure is DoubleFailureUP) {
          yield Error(message: DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD);
        } else if (failure is UsernameInputFailure) {
          yield Error(message: USERNAME_INPUT_FAILURE);
        } else if (failure is PasswordInputFailure) {
          yield Error(message: PASSWORD_INPUT_FAILURE);
        } else if (failure is AllInputFailure) {
          yield Error(message: All_INPUT_INPUT_FAILURE);
        } else if (failure is DoubleFailureUE) {
          yield Error(message: DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD);
        } else if (failure is DoubleFailureEP) {
          yield Error(message: DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD);
        }
      }, (string) async* {
        yield Loading();
        final failureOrToken = await register(params);
        yield* failureOrToken.fold((failure) async* {
          yield Error(message: SERVER_FAILURE_MESSAGE);
        }, (token) async* {
          if (token == "Login isues") {
            yield Error(message: token);
          } else {
            yield Loaded(token: token);
          }
        });
      });
    }
  }
}
