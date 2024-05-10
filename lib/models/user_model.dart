class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;

  UserModel(
  {
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId
  }
  );

  final List<String> groupId;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'uid': this.uid,
      'profilePic': this.profilePic,
      'isOnline': this.isOnline,
      'phoneNumber': this.phoneNumber,
      'groupId': this.groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId']),
    );
  }
}