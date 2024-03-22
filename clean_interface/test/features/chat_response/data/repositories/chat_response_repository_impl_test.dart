import 'package:clean_interface/core/platform/network_info.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_local_data_source.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_remote_data_source.dart';
import 'package:clean_interface/features/chat_response/data/repositories/chat_response_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock
    implements ChatResposeRemoteDataSource {}

class MockLocalDataSource extends Mock implements ChatResposeLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ChatResponseRepositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ChatResponseRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
