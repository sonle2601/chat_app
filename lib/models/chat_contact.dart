import 'package:cloud_firestore/cloud_firestore.dart';

class ChatContact{
  final String name;
  final String profilePic;
  final String contactId;
  final String lastMessage;
  final DateTime timeSent;

  ChatContact({
    required this.name,
    required this.profilePic,
    required this.contactId,
    required this.lastMessage,
    required this.timeSent
});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'profilePic': this.profilePic,
      'contactId': this.contactId,
      'lastMessage': this.lastMessage,
      'timeSent': this.timeSent,
    };
  }

  factory ChatContact.fromMap(Map<String, dynamic> map) {
    DateTime? timeSent;
    if (map['timeSent'] is Timestamp) {
      timeSent = (map['timeSent'] as Timestamp).toDate();
    } else {
      timeSent = DateTime.now(); // Đặt giá trị mặc định, ví dụ như DateTime.now()
    }

    return ChatContact(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      contactId: map['contactId'] as String,
      lastMessage: map['lastMessage'] as String,
      timeSent: timeSent ?? DateTime.now(), // Đặt giá trị mặc định nếu null
    );
  }

}