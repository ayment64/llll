import 'package:llll/Core/Platform/Network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;
  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });
  group('Is Connected', () {
    test('should forward the call to DataConnectionChecker.HasConnection',
        () async {
          final tHasConnectionFuture = Future.value(true);
      //arange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_)=> tHasConnectionFuture);
      //act
      final result= networkInfoImpl.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
      //assert
    });
  });
}
