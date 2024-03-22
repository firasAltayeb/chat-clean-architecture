import '../../domain/entities/chat_response.dart';

abstract class ChatResposeRemoteDataSource {
  Future<ChatResponse> getChatResponse(String message);
}
