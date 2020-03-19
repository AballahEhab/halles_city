import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String id;
  String content;
  String userId;
  Timestamp timestamp;

  Comment({
    this.id,
    this.content,
    this.userId,
    this.timestamp,
  });

  factory Comment.fromDoc(DocumentSnapshot dosa) {
    return Comment(
      id: dosa.documentID,
      content: dosa['content'],
      userId: dosa['UserId'],
      timestamp: dosa['timestamp'],
    );
  }
}
