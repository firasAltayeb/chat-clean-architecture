class ChatMessage {
  final String role;
  final String content;

  const ChatMessage({
    required this.role,
    required this.content,
  });

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.role == role && other.content == content;
  }

  @override
  int get hashCode => role.hashCode ^ content.hashCode;

  ChatMessage copyWith({
    String? role,
    String? content,
  }) {
    return ChatMessage(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }
}
