import 'dart:convert';

import '../../../../core/utils/hive_box.dart';
import '../../../../core/utils/types.dart';
import '../models/chat_response_model.dart';

abstract class ChatResposeLocalDataSource {
  Future<ChatResponseModels> getChatResponseList();
  Future<void> cacheChatResponse(ChatResponseModel chatResponse);
}

class ChatResposeLocalDataSourceImpl implements ChatResposeLocalDataSource {
  final LocalCacheBox box;

  ChatResposeLocalDataSourceImpl({
    required this.box,
  });

  @override
  Future<ChatResponseModels> getChatResponseList() {
    final jsonString = box.getChatResponseListJson();
    if (jsonString.isNotEmpty) {
      final jsonResponse = jsonDecode(jsonString) as List<dynamic>;
      final chatResponseList =
          jsonResponse.map((i) => ChatResponseModel.fromMap(i)).toList();
      return Future.value(chatResponseList);
    } else {
      final ChatResponseModels temp = [];
      return Future.value(temp);
    }
  }

  @override
  Future<void> cacheChatResponse(ChatResponseModel chatResponse) async {
    final cachedList = await getChatResponseList()
      ..add(chatResponse);
    final jsonString = jsonEncode(cachedList);
    await box.setChatResponseListJson(jsonString);
  }
}
