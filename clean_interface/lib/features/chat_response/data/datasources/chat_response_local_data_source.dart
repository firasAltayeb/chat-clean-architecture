import 'package:clean_interface/core/utils/types.dart';
import 'package:clean_interface/features/chat_response/data/models/chat_response_model.dart';

abstract class ChatResposeLocalDataSource {
  Future<ChatResponseList> getChatResponseList();
  Future<void> cacheChatResponse(ChatResponseModel chatResponse);
}
