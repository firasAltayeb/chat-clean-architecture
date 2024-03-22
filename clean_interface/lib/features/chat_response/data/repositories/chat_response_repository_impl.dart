import 'package:clean_interface/core/errors/failure.dart';
import 'package:clean_interface/core/platform/network_info.dart';
import 'package:clean_interface/core/utils/types.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_local_data_source.dart';
import 'package:clean_interface/features/chat_response/data/datasources/chat_response_remote_data_source.dart';
import 'package:clean_interface/features/chat_response/domain/entities/chat_response.dart';
import 'package:clean_interface/features/chat_response/domain/repositories/chat_response_repository.dart';
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
  Future<Either<Failure, ChatResponse>> getChatResponse(String message) {
    // TODO: implement getChatResponse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ChatResponseList>> getChatResponseList() {
    // TODO: implement getChatResponseList
    throw UnimplementedError();
  }
}
