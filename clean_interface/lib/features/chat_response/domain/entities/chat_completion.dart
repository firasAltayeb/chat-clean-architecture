import '../../../../core/utils/types.dart';

class ChatCompletion {
  final String id;
  final DateTime created;
  final ChatChoiceLst choices;

  bool get haveChoices => choices.isNotEmpty;

  const ChatCompletion({
    required this.id,
    required this.created,
    required this.choices,
  });

  @override
  bool operator ==(covariant ChatCompletion other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created == created &&
        other.choices == choices;
  }

  @override
  int get hashCode => id.hashCode ^ created.hashCode ^ choices.hashCode;

  ChatCompletion copyWith({
    String? id,
    DateTime? created,
    ChatChoiceLst? choices,
  }) {
    return ChatCompletion(
      id: id ?? this.id,
      created: created ?? this.created,
      choices: choices ?? this.choices,
    );
  }
}
