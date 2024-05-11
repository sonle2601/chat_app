import 'package:chat_app/common/enums/message_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String recieverId;
  final String text;
  final MessageEnum type;
  final DateTime timeSent;
  final String messageId;
  final bool isSend;

  Message(
  {
    required this.senderId,
    required this.recieverId,
    required this.text,
    required this.type,
    required this.timeSent,
    required this.messageId,
    required this.isSend
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': this.senderId,
      'recieverId': this.recieverId,
      'text': this.text,
      'type': this.type.type,
      'timeSent': this.timeSent,
      'messageId': this.messageId,
      'isSend': this.isSend,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    DateTime? timeSent;
    if (map['timeSent'] is Timestamp) {
      timeSent = (map['timeSent'] as Timestamp).toDate();
    } else {
      timeSent = DateTime.now(); // Đặt giá trị mặc định, ví dụ như DateTime.now()
    }
    return Message(
      senderId: map['senderId'] as String,
      recieverId: map['recieverId'] as String,
      text: map['text'] as String,
      type: (map['type'] as String).toEnum(),
      timeSent: timeSent ?? DateTime.now(), // Đặt giá trị mặc định nếu null
      messageId: map['messageId'] as String,
      isSend: map['isSend'] as bool,
    );
  }
}