import 'chat_message.dart';

class ChatChoice {
  final int index;
  final ChatMessage message;
  final String? finishReason;

  const ChatChoice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  @override
  bool operator ==(covariant ChatChoice other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.message == message &&
        other.finishReason == finishReason;
  }

  @override
  int get hashCode => index.hashCode ^ message.hashCode ^ finishReason.hashCode;

  ChatChoice copyWith({
    int? index,
    ChatMessage? message,
    String? finishReason,
  }) {
    return ChatChoice(
      index: index ?? this.index,
      message: message ?? this.message,
      finishReason: finishReason ?? this.finishReason,
    );
  }
}
