import 'dart:convert';

class Message {
  final int id;
  final String sender;
  final String subject;
  final message;
  final timestamp;

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        sender = json['sender'] ?? '',
        subject = json['subject'] ?? '',
        message = json['message'] ?? '',
        timestamp = json['timestamp'] ?? '';

  @override
  String toString() {
    String s = '';
    if (message is List) {
      for (var item in message) {
        item.forEach((k, v) {
          s += '$k : $v\n';
        });
        s += '\n';
      }
    }
    return s;
  }
}
