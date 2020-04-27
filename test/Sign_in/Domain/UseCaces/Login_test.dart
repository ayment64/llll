import 'package:llll/Features/Sign_in/Domain/Repositories/User_Repository.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  Login usecase;
  MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = Login(mockUserRepository);
  });
  final username = "aymen";
  final password = "23577571a";
  final String response='''eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.
          eyJpYXQiOjE1ODYyNTg5NjksImV4cCI6MTU4NjI2MjU2OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoia2hhbGVkIn0.
          T1A3F2o_YKEoq0kKSq422tEkZlI_AqTjqWIMP5iPyJqxUXYxBwtddTxuogFvi1EnBeMW4EalbBIvBKi5m8FGo0KkhKNzGdSw-537KGCoI_MKSeuqA5C3sOwmrLwkFD6f6tDymoUsekDCj6YCwGUlHw2S-bxSSNBqWNTNOVT-oYS73PxxEnwydTWaPC-KQ2fmNGRXjlSHwV4yK8pIXmjSY9XBAQzCSgXav6Q0gu6g1C8MXFNwdk6vh2FJvH3GTBmkGfT2d7nD6p6dirrUckC0JwNts9ZqqP4uzPP6aHAQvmxz9ciqr8U0xv_F7fgJ6hRZJVgs-LgzFYpRzRGZZpxntAvqHBPp_awR5W97fVHLQRGs8tRmKQVLm8ehRtp7-vbXlX9gk1R2QAdbsGkA6FdikfZ8YdoeA4NwtFKLrnjYqI-FWm7gY-993rePyX-MyjQU94U9SuS2RLG60-ogJhxbdF8L4br0NWU9ddtfSyvNZDnMxQDA-Nfxq-L2obTfb3cCNwXf12p6YAxAC8DlrWymciWF8vueem3AU_0LBRkaDHC8A6ThNLFAxLanGRklkR6xzMn5bkvKu8avpTvmKHYTB2QF9LfYgYLbiJucyq6YXKdTJ1WpsiZ-HLXtI_EbPTjMuNfdxa37Wqk8E6uYm4lpKJnGjw-z8Io-gMfPvNZGDxs''';
  test(
    'Should get Login Response',
    () async {
      //arrange
      when(mockUserRepository.login(username, password))
          .thenAnswer((_) async => Right(response));
      //act
      final params = Params(username: username, password: password);
      final result = await usecase(params);
      //assert
      expect(result, Right(response));
      verify(mockUserRepository.login(username, password));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
