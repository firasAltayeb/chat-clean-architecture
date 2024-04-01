import 'package:clean_interface/features/chat_response/data/models/chat_message_model.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_message.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final chatResponseModel = ChatMessageModel(role: "user", content: "test");

  test(
    "should be a subclass of ChatResponse entity",
    () async {
      expect(chatResponseModel, isA<ChatMessage>());
    },
  );

  test(
    "should return a valid model",
    () async {
      final jsonMap = fixture('chat_message.json');

      final result = ChatMessageModel.fromJson(jsonMap);

      expect(result, chatResponseModel);
    },
  );

  test(
    "should return a json containing proper data",
    () async {
      final result = chatResponseModel.toJson();

      final jsonString =
          fixture('chat_message.json').replaceAll("\n", "").replaceAll(" ", "");

      expect(result, jsonString);
    },
  );
}
