import 'package:dartz/dartz.dart';

import 'package:clean_interface/core/errors/failure.dart';
import 'package:clean_interface/core/usecases/usecase.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_message.dart';

import '../repositories/chat_response_repository.dart';

class GetChatResponse implements UseCase<ChatMessage, String> {
  final ChatResponseRepository repository;

  GetChatResponse({
    required this.repository,
  });

  @override
  Future<Either<Failure, ChatMessage>> call(String message) async {
    return await repository.getChatResponse(message);
  }
}
