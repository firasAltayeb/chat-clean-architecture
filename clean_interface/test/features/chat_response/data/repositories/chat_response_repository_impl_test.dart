import 'package:clean_interface/core/errors/failure.dart';
import 'package:clean_interface/core/errors/messages.dart';
import 'package:clean_interface/core/platform/network_info.dart';
import 'package:clean_interface/core/utils/types.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_local_data_source.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_remote_data_source.dart';
import 'package:clean_interface/features/chat_response/data/models/chat_response_model.dart';
import 'package:clean_interface/features/chat_response/data/repositories/chat_response_repository_impl.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock
    implements ChatResposeRemoteDataSource {}

class MockLocalDataSource extends Mock implements ChatResposeLocalDataSource {}

class MockChatResponseModel extends Mock implements ChatResponseModel {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ChatResponseRepositoryImpl repository;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    registerFallbackValue(MockChatResponseModel());
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ChatResponseRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final chatResponseModel = ChatResponseModel(role: 'user', content: 'test');
  final ChatResponse chatResponse = chatResponseModel;
  final ChatResponseList chatResponseList = [chatResponse];
  const message = 'test';

  group('device is online', () {
    setUp(() {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockLocalDataSource.cacheChatResponse(any()))
          .thenAnswer((_) async {});
    });

    test(
      "should return remote data when call to remote is successul",
      () async {
        when(() => mockRemoteDataSource.getChatResponse(any()))
            .thenAnswer((_) async => chatResponseModel);
        final result = await repository.getChatResponse(message);

        verify(() => mockRemoteDataSource.getChatResponse(message)).called(1);
        expect(result, Right(chatResponse));
      },
    );

    test(
      "should return failure when call to remote is unsuccessul",
      () async {
        when(() => mockRemoteDataSource.getChatResponse(any()))
            .thenThrow(Exception());
        final result = await repository.getChatResponse(message);

        verify(() => mockRemoteDataSource.getChatResponse(message)).called(1);
        verifyNever(
            () => mockLocalDataSource.cacheChatResponse(chatResponseModel));
        expect(result, left(const Failure(ErrorMessage.getChatResponseError)));
      },
    );

    test(
      "should cache the data locally when call to remote is successul",
      () async {
        when(() => mockRemoteDataSource.getChatResponse(any()))
            .thenAnswer((_) async => chatResponseModel);
        await repository.getChatResponse(message);

        verify(() => mockRemoteDataSource.getChatResponse(message)).called(1);
        verify(() => mockLocalDataSource.cacheChatResponse(chatResponseModel))
            .called(1);
      },
    );
  });

  test(
    "should return cached data when data is present",
    () async {
      when(() => mockLocalDataSource.getChatResponseList())
          .thenAnswer((_) async => chatResponseList);

      final result = await repository.getChatResponseList();

      verify(() => mockLocalDataSource.getChatResponseList()).called(1);
      expect(result, Right(chatResponseList));
    },
  );

  test(
    "should return failure when data is not present",
    () async {
      when(() => mockLocalDataSource.getChatResponseList())
          .thenThrow(Exception());

      final result = await repository.getChatResponseList();

      verify(() => mockLocalDataSource.getChatResponseList()).called(1);
      expect(
        result,
        left(const Failure(ErrorMessage.getChatResponseListError)),
      );
    },
  );
}
