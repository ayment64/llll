import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Presentation_logic/Utils/Input_checker.dart';
import 'package:llll/Core/Presentation_logic/Utils/register_input_cheker.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';
import 'package:dartz/dartz.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLogin extends Mock implements Login {}
class MockRegister extends Mock implements Register {}

class MockInputChecker extends Mock implements InputChecker {}
class MockRegisterInputChecker extends Mock implements RegisterInputChecker {}

void main() {
  LoginBloc bloc;
  MockLogin tLogin;
  MockRegister tRegister;
  MockInputChecker tInputCheker;
  MockRegisterInputChecker mockRegisterInputChecker;
  setUp(() {
    tLogin = MockLogin();
    tRegister = MockRegister();
    tInputCheker = MockInputChecker();
    bloc = LoginBloc(inputChecker: tInputCheker, login: tLogin,register:tRegister,registerInputChecker:mockRegisterInputChecker );
  });
  test('initial state should be empty', () {
    expect(bloc.initialState, equals(Empty()));
  });
  group('Login Input', () {
    final response = '''eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.
          eyJpYXQiOjE1ODYyNTg5NjksImV4cCI6MTU4NjI2MjU2OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoia2hhbGVkIn0.
          T1A3F2o_YKEoq0kKSq422tEkZlI_AqTjqWIMP5iPyJqxUXYxBwtddTxuogFvi1EnBeMW4EalbBIvBKi5m8FGo0KkhKNzGdSw-537KGCoI_MKSeuqA5C3sOwmrLwkFD6f6tDymoUsekDCj6YCwGUlHw2S-bxSSNBqWNTNOVT-oYS73PxxEnwydTWaPC-KQ2fmNGRXjlSHwV4yK8pIXmjSY9XBAQzCSgXav6Q0gu6g1C8MXFNwdk6vh2FJvH3GTBmkGfT2d7nD6p6dirrUckC0JwNts9ZqqP4uzPP6aHAQvmxz9ciqr8U0xv_F7fgJ6hRZJVgs-LgzFYpRzRGZZpxntAvqHBPp_awR5W97fVHLQRGs8tRmKQVLm8ehRtp7-vbXlX9gk1R2QAdbsGkA6FdikfZ8YdoeA4NwtFKLrnjYqI-FWm7gY-993rePyX-MyjQU94U9SuS2RLG60-ogJhxbdF8L4br0NWU9ddtfSyvNZDnMxQDA-Nfxq-L2obTfb3cCNwXf12p6YAxAC8DlrWymciWF8vueem3AU_0LBRkaDHC8A6ThNLFAxLanGRklkR6xzMn5bkvKu8avpTvmKHYTB2QF9LfYgYLbiJucyq6YXKdTJ1WpsiZ-HLXtI_EbPTjMuNfdxa37Wqk8E6uYm4lpKJnGjw-z8Io-gMfPvNZGDxs''';

    final username = 'ayment64';
    //arange
    final password = "xxxxxx";
    final params = Params(password: password, username: username);
    test(
        "should check if the username is obeying the syntax defined for it <255",
        () async {
      when(tInputCheker(any)).thenReturn(Right("all good"));
      //act
      bloc.dispatch(Signin(password: password, username: username));
      await untilCalled(tInputCheker(params));

      //assert
      verify(tInputCheker.call(params));
    });
    test('should emit username [Error]  if syntax is not obeyed',
        () async {
      //arange
      when(tInputCheker(any)).thenReturn(Left(UsernameInputFailure()));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
      //assert
      final exprcted = [Empty(), Error(message: USERNAME_INPUT_FAILURE)];
      expectLater(bloc.state, emitsInOrder(exprcted));
    });
    test('should emit Double input [Error] error if syntax is not obeyed',
        () async {
      //arange
      when(tInputCheker(any)).thenReturn(Left(DoubleFailure()));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
      //assert
      final exprcted = [Empty(), Error(message: DOUBLE_INPUT_FAILURE_USERNAME_PASSWORD)];
      expectLater(bloc.state, emitsInOrder(exprcted));
    });
    test('should emit Password [Error] error if syntax is not obeyed',
        () async {
      //arange
      when(tInputCheker(any)).thenReturn(Left(PasswordInputFailure()));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
      //assert
      final exprcted = [Empty(), Error(message: PASSWORD_INPUT_FAILURE)];
      expectLater(bloc.state, emitsInOrder(exprcted));
    });
    test('should return token from the log in usecase', () async {
      //arange
      when(tInputCheker(params)).thenReturn(Right("all good"));
      when(tLogin(params)).thenAnswer((_) async => Right(response));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
      await untilCalled(tLogin(params));
      //assert
      verify(tLogin(params));
    });
    test('should emit [loading,loaded] when token is gotten successfully',
        () async {
      //arange
      when(tInputCheker(params)).thenReturn(Right("all good"));
      when(tLogin(params)).thenAnswer((_) async => Right(response));
      //assert
      final expected = [
        Empty(),
        Loading(),
        Loaded(token: response)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
    });
    test('should emit [loading,Error] when getting token fails',
        () async {
      //arange
      when(tInputCheker(params)).thenReturn(Right("all good"));
      when(tLogin(params)).thenAnswer((_) async => Left(ServerFailure()));
      //assert
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
    });
    test('should emit [loading,Error] with a propper message  for the error when getting data fails',
        () async {
      //arange
      when(tInputCheker(params)).thenReturn(Right("all good"));
      when(tLogin(params)).thenAnswer((_) async => Left(ServerFailure()));
      //assert
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.state, emitsInOrder(expected));
      //act
      bloc.dispatch((Signin(password: password, username: username)));
    });
  });
}
