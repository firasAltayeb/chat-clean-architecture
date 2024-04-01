import '../../../../core/errors/failure.dart';
import '../../../../core/utils/types.dart';
import '../entities/chat_message.dart';
import 'package:dartz/dartz.dart';

abstract class ChatResponseRepository {
  Future<Either<Failure, ChatMessage>> getChatResponse(String message);
  Future<Either<Failure, ChatMessageLst>> getChatResponseList();
}
