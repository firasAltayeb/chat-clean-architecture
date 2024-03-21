import 'package:clean_interface/features/chat_response/data/datasources/chat_response_model.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final chatResponseModel = ChatResponseModel(role: "user", content: "test");

  test(
    "should be a subclass of ChatResponse entity",
    () async {
      expect(chatResponseModel, isA<ChatResponse>());
    },
  );

  test(
    "should return a valid model",
    () async {
      final jsonMap = fixture('chat_response.json');

      final result = ChatResponseModel.fromJson(jsonMap);

      expect(result, chatResponseModel);
    },
  );

  test(
    "should return a json containing proper data",
    () async {
      final result = chatResponseModel.toJson();

      final jsonString = fixture('chat_response.json')
          .replaceAll("\n", "")
          .replaceAll(" ", "");

      expect(result, jsonString);
    },
  );
}
