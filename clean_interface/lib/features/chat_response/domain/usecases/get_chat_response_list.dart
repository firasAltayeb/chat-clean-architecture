import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_response_repository.dart';
import 'package:dartz/dartz.dart';

class GetChatResponseList implements UseCase<ChatMessageLst, NoParams> {
  final ChatResponseRepository repository;

  GetChatResponseList({
    required this.repository,
  });

  @override
  Future<Either<Failure, ChatMessageLst>> call(NoParams params) async {
    return await repository.getChatResponseList();
  }
}
