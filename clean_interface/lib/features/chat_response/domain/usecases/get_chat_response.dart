import 'package:dartz/dartz.dart';

import 'package:clean_interface/core/errors/failure.dart';
import 'package:clean_interface/core/usecases/usecase.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';

import '../repositories/chat_response_repository.dart';

class GetChatResponse implements UseCase<ChatResponse, String> {
  final ChatResponseRepository repository;

  GetChatResponse({
    required this.repository,
  });

  @override
  Future<Either<Failure, ChatResponse>> call(String message) async {
    return await repository.getChatResponse(message);
  }
}
