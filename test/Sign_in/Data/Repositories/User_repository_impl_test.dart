import 'package:llll/Core/Error/Exeptions.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Core/Platform/Network_info.dart';
import 'package:llll/Features/Sign_in/Data/DataSource/User_remote_data_source.dart';
import 'package:llll/Features/Sign_in/Data/Repositories/User_repository_impl.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  UserRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
  });
  group("Login ", () {
    final params = Params(username: "ayment64", password: "xxxxx");
    final response='''eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.
          eyJpYXQiOjE1ODYyNTg5NjksImV4cCI6MTU4NjI2MjU2OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoia2hhbGVkIn0.
          T1A3F2o_YKEoq0kKSq422tEkZlI_AqTjqWIMP5iPyJqxUXYxBwtddTxuogFvi1EnBeMW4EalbBIvBKi5m8FGo0KkhKNzGdSw-537KGCoI_MKSeuqA5C3sOwmrLwkFD6f6tDymoUsekDCj6YCwGUlHw2S-bxSSNBqWNTNOVT-oYS73PxxEnwydTWaPC-KQ2fmNGRXjlSHwV4yK8pIXmjSY9XBAQzCSgXav6Q0gu6g1C8MXFNwdk6vh2FJvH3GTBmkGfT2d7nD6p6dirrUckC0JwNts9ZqqP4uzPP6aHAQvmxz9ciqr8U0xv_F7fgJ6hRZJVgs-LgzFYpRzRGZZpxntAvqHBPp_awR5W97fVHLQRGs8tRmKQVLm8ehRtp7-vbXlX9gk1R2QAdbsGkA6FdikfZ8YdoeA4NwtFKLrnjYqI-FWm7gY-993rePyX-MyjQU94U9SuS2RLG60-ogJhxbdF8L4br0NWU9ddtfSyvNZDnMxQDA-Nfxq-L2obTfb3cCNwXf12p6YAxAC8DlrWymciWF8vueem3AU_0LBRkaDHC8A6ThNLFAxLanGRklkR6xzMn5bkvKu8avpTvmKHYTB2QF9LfYgYLbiJucyq6YXKdTJ1WpsiZ-HLXtI_EbPTjMuNfdxa37Wqk8E6uYm4lpKJnGjw-z8Io-gMfPvNZGDxs''';
   

    test('should check if the device is online', () async {
      //arange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      repository.login(params.username, params.password);
      //assert
      verify(mockNetworkInfo.isConnected);
    });
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return remote data when the call to remote data source is succesful',
          () async {
        //arange
        when(mockRemoteDataSource.login(any, any))
            .thenAnswer((_) async => response);
        //act
        final result = await repository.login(params.username, params.password);
        //assert
        verify(mockRemoteDataSource.login(params.username, params.password));
        expect(result, Right(response));
      });

      test(
          'should return server failure when the call to remote data source is unsuccesful',
          () async {
        //arange
        when(mockRemoteDataSource.login(any, any)).thenThrow(ServerExeption());
        //act
        final result = await repository.login(params.username, params.password);
        //assert
        verify(mockRemoteDataSource.login(params.username, params.password));
        expect(result, Left(ServerFailure()));
      });
    });
  });
}
