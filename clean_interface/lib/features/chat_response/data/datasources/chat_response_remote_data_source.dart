import 'package:clean_interface/features/chat_response/data/models/chat_message_model.dart';

abstract class ChatResposeRemoteDataSource {
  Future<ChatMessageModel> getChatResponse(String message);
}
