import 'package:clean_interface/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to InternetConnectionChecker.hasConnection',
      () async {
        final hasConnectionFuture = Future.value(true);

        when(() => mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) => hasConnectionFuture);

        final result = networkInfo.isConnected;

        verify(() => mockDataConnectionChecker.hasConnection);
        // Utilizing Dart's default referential equality.
        // Only references to the same object are equal.
        expect(result, hasConnectionFuture);
      },
    );
  });
}
