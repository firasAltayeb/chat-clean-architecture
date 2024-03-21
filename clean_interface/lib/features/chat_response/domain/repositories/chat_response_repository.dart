import '../../../../core/errors/failure.dart';
import '../../../../core/types.dart';
import '../entities/message.dart';
import 'package:dartz/dartz.dart';

abstract class ChatResponseRepository {
  Future<Either<Failure, Message?>> getMessage();
  Future<Either<Failure, MessageList>> getMessages();
}
