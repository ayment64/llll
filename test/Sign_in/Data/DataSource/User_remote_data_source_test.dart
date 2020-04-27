import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
  });
  group('Login', () {
    test('Should perform a POST request at a URL and application/json header', () async {
      //arange
        when(mockHttpClient.post(any));
      //act

      //assert
    });
  });
}
