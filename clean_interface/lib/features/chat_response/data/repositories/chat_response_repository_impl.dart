import '../../../../core/errors/failure.dart';
import '../../../../core/errors/messages.dart';
import '../../../../core/platform/network_info.dart';
import '../../../../core/utils/types.dart';
import '../datasources/chat_response_local_data_source.dart';
import '../datasources/chat_response_remote_data_source.dart';
import '../../domain/entities/chat_response.dart';
import '../../domain/repositories/chat_response_repository.dart';
import 'package:dartz/dartz.dart';

class ChatResponseRepositoryImpl implements ChatResponseRepository {
  final ChatResposeLocalDataSource localDataSource;
  final ChatResposeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ChatResponseRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ChatResponse>> getChatResponse(String message) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await remoteDataSource.getChatResponse(message);
        await localDataSource.cacheChatResponse(remoteResponse);
        return Right(remoteResponse);
      } catch (e) {
        return const Left(
          Failure(ErrorMessage.getChatResponseError),
        );
      }
    } else {
      return Right(
        ChatResponse(
          role: "assistant",
          content: ErrorMessage.noInternet,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ChatResponseList>> getChatResponseList() async {
    try {
      final localResponse = await localDataSource.getChatResponseList();
      return Right(localResponse);
    } catch (e) {
      return const Left(
        Failure(ErrorMessage.getChatResponseListError),
      );
    }
  }
}
