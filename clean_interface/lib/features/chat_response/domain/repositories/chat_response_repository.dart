import '../../../../core/errors/failure.dart';
import '../../../../core/utils/types.dart';
import '../entities/chat_response.dart';
import 'package:dartz/dartz.dart';

abstract class ChatResponseRepository {
  Future<Either<Failure, ChatResponse>> getChatResponse(String message);
  Future<Either<Failure, ChatResponseList>> getChatResponseList();
}
