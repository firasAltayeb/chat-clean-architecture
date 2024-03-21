class Message {
  final String role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.role == role && other.content == content;
  }

  @override
  int get hashCode => role.hashCode ^ content.hashCode;
}
