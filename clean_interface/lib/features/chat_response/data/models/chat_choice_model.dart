import 'dart:convert';

import '../../domain/entities/chat_choice.dart';
import 'chat_message_model.dart';

class ChatChoiceModel extends ChatChoice {
  const ChatChoiceModel({
    required super.index,
    required super.message,
    required super.finishReason,
  });

  factory ChatChoiceModel.fromMap(Map<String, dynamic> json) {
    return ChatChoiceModel(
      index: json['index'],
      message: ChatMessageModel.fromMap(json['message']),
      finishReason: json['finish_reason'],
    );
  }

  Map<String, dynamic> toMap() {
    ChatMessageModel value = message as ChatMessageModel;
    return {
      "index": index,
      "message": value.toMap(),
      "finish_reason": finishReason,
    };
  }

  String toJson() => json.encode(toMap());

  factory ChatChoiceModel.fromJson(String source) =>
      ChatChoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
