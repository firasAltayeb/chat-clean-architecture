import 'dart:convert';

import 'chat_choice_model.dart';
import '../../domain/entities/chat_completion.dart';

import '../../../../core/utils/types.dart';

class ChatCompletionModel extends ChatCompletion {
  ChatCompletionModel({
    required super.id,
    required super.created,
    required super.choices,
  });

  Map<String, dynamic> toMap() {
    ChatChoiceModelLst value = choices.cast<ChatChoiceModel>();
    return <String, dynamic>{
      'id': id,
      'created': created.millisecondsSinceEpoch,
      'choices': value.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatCompletionModel.fromMap(Map<String, dynamic> map) {
    final value = map['choices'] as List<dynamic>;
    return ChatCompletionModel(
      id: map['id'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      choices: value.map((x) => ChatChoiceModel.fromMap(x)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatCompletionModel.fromJson(String source) =>
      ChatCompletionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
