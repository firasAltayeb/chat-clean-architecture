import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';
import 'package:clean_interface/features/chat_response/domain/repositories/chat_response_repository.dart';
import 'package:clean_interface/features/chat_response/domain/usecases/get_chat_response.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

class MockChatResponseRepository extends Mock
    implements ChatResponseRepository {}

void main() {
  late MockChatResponseRepository mockChatResponseRepository;
  late GetChatResponse usecase;

  setUp(() {
    mockChatResponseRepository = MockChatResponseRepository();
    usecase = GetChatResponse(repository: mockChatResponseRepository);
  });

  final aChatResponse = ChatResponse(role: "user", content: "test");
  const message = "test";

  test(
    "should get chat response for message ",
    () async {
      when(() => mockChatResponseRepository.getChatResponse(any()))
          .thenAnswer((_) async => Right(aChatResponse));

      final result = await usecase(message);

      expect(result, Right(aChatResponse));
      verify(() => mockChatResponseRepository.getChatResponse(message))
          .called(1);
      verifyNoMoreInteractions(mockChatResponseRepository);
    },
  );
}
