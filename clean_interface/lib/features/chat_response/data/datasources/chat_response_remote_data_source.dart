import 'package:clean_interface/features/chat_response/data/models/chat_response_model.dart';

abstract class ChatResposeRemoteDataSource {
  Future<ChatResponseModel> getChatResponse(String message);
}
