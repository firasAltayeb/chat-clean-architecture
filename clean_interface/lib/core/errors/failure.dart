import 'package:flutter/foundation.dart' show immutable;

@immutable
class Failure {
  final String message;

  const Failure(this.message);

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
