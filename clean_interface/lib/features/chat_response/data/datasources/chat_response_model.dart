import 'dart:convert';

import '../../domain/entities/chat_response.dart';

class ChatResponseModel extends ChatResponse {
  ChatResponseModel({
    required super.role,
    required super.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'content': content,
    };
  }

  factory ChatResponseModel.fromMap(Map<String, dynamic> map) {
    return ChatResponseModel(
      role: map['role'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatResponseModel.fromJson(String source) =>
      ChatResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
