class JoinedGroup {
  String postText;
  String postimgUrl;
  DateTime timestamp;
  String userName;
  String userImg;
  String email;
  double score;
  JoinedGroup({
    required this.postText,
    required this.postimgUrl,
    required this.timestamp,
    required this.userName,
    required this.userImg,
    required this.email,
    required this.score,
  });

  factory JoinedGroup.fromJson(Map<String, dynamic> map) {
    return JoinedGroup(
      postText: map['postText'] ?? '',
      postimgUrl: map['postimgUrl'] ?? '',
      timestamp: (map['timestamp']).toDate(),
      userName: map['userName'] ?? '',
      userImg: map['userImg'] ?? '',
      email: map['email'] ?? '',
      score: map['score'] ?? '',
    );
  }
}
