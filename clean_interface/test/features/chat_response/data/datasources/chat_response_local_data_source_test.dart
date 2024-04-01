import 'dart:convert';

import 'package:clean_interface/core/utils/hive_box.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_local_data_source.dart';
import 'package:clean_interface/features/chat_response/data/models/chat_message_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockLocalCacheBox extends Mock implements LocalCacheBox {}

void main() {
  late ChatResposeLocalDataSourceImpl dataSource;
  late MockLocalCacheBox mockHiveBox;

  setUp(() {
    mockHiveBox = MockLocalCacheBox();
    dataSource = ChatResposeLocalDataSourceImpl(
      box: mockHiveBox,
    );
  });

  final chatResponseList = jsonDecode(fixture('cached_chat_messages.json'))
      .map((i) => ChatMessageModel.fromMap(i))
      .toList();

  test(
    'should return ChatResponseListJson from Hive when available',
    () async {
      when(() => mockHiveBox.getChatResponseListJson())
          .thenReturn(fixture('cached_chat_messages.json'));
      // act
      final result = await dataSource.getChatResponseList();
      // assert
      verify(() => mockHiveBox.getChatResponseListJson()).called(1);
      expect(result, chatResponseList);
    },
  );

  final chatResponseModel = ChatMessageModel(role: 'user', content: 'test');
  final chatResponses = [chatResponseModel];

  test(
    "should call hivebox to cache the data",
    () async {
      // arrange
      final expextedJsonStr = jsonEncode(chatResponses);
      when(() => mockHiveBox.getChatResponseListJson()).thenReturn('');
      when(() => mockHiveBox.setChatResponseListJson(any()))
          .thenAnswer((_) => Future.value());
      // act
      await dataSource.cacheChatResponse(chatResponseModel);
      // assert
      verify(() => mockHiveBox.setChatResponseListJson(expextedJsonStr));
    },
  );
}
