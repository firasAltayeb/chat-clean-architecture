import 'package:clean_interface/core/utils/types.dart';

abstract class ChatResposeLocalDataSource {
  Future<ChatResponseList> getChatResponseList();
  Future<ChatResponseList> cacheChatResponseList();
}
