import 'package:clean_interface/core/usecases/no_params.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';
import 'package:clean_interface/features/chat_response/domain/repositories/chat_response_repository.dart';
import 'package:clean_interface/features/chat_response/domain/usecases/get_chat_response_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatResponseRepository extends Mock
    implements ChatResponseRepository {}

void main() {
  late MockChatResponseRepository mockChatResponseRepository;
  late GetChatResponseList usecase;

  setUp(() {
    mockChatResponseRepository = MockChatResponseRepository();
    usecase = GetChatResponseList(repository: mockChatResponseRepository);
  });

  final aChatResponseList = [ChatResponse(role: "user", content: "test")];

  test(
    "should get chat response list ",
    () async {
      when(() => mockChatResponseRepository.getChatResponseList())
          .thenAnswer((_) async => Right(aChatResponseList));

      final result = await usecase(NoParams());

      expect(result, Right(aChatResponseList));
      verify(() => mockChatResponseRepository.getChatResponseList()).called(1);
      verifyNoMoreInteractions(mockChatResponseRepository);
    },
  );
}
