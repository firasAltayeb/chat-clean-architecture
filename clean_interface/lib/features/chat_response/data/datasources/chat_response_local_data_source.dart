import 'dart:convert';

import '../../../../core/utils/hive_box.dart';
import '../../../../core/utils/types.dart';
import '../models/chat_message_model.dart';

abstract class ChatResposeLocalDataSource {
  Future<ChatMessageModelLst> getChatResponseList();
  Future<void> cacheChatResponse(ChatMessageModel chatResponse);
}

class ChatResposeLocalDataSourceImpl implements ChatResposeLocalDataSource {
  final LocalCacheBox box;

  ChatResposeLocalDataSourceImpl({
    required this.box,
  });

  @override
  Future<ChatMessageModelLst> getChatResponseList() {
    final jsonString = box.getChatResponseListJson();
    if (jsonString.isNotEmpty) {
      final jsonResponse = jsonDecode(jsonString) as List<dynamic>;
      final chatResponseList =
          jsonResponse.map((i) => ChatMessageModel.fromMap(i)).toList();
      return Future.value(chatResponseList);
    } else {
      final ChatMessageModelLst temp = [];
      return Future.value(temp);
    }
  }

  @override
  Future<void> cacheChatResponse(ChatMessageModel chatResponse) async {
    final cachedList = await getChatResponseList()
      ..add(chatResponse);
    final jsonString = jsonEncode(cachedList);
    await box.setChatResponseListJson(jsonString);
  }
}
