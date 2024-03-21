import 'package:dartz/dartz.dart';

import 'package:clean_interface/core/errors/failure.dart';
import 'package:clean_interface/core/usecases/usecase.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';

import '../repositories/chat_response_repository.dart';

class GetChatResponse implements UseCase<ChatResponse?, Params> {
  final ChatResponseRepository repository;

  GetChatResponse({
    required this.repository,
  });

  @override
  Future<Either<Failure, ChatResponse?>> call(Params params) async {
    return await repository.getChatResponse(params.message);
  }
}

class Params {
  final String message;

  Params({
    required this.message,
  });

  @override
  bool operator ==(covariant Params other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
