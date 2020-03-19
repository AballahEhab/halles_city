import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bio;
  final bool isVerifiedUser;

  User({
    this.id,
    this.name,
    this.profileImageUrl,
    this.email,
    this.bio,
    this.isVerifiedUser,
  });

  factory User.fromDoc(DocumentSnapshot dosa) {
    return User(
      id: dosa.documentID,
      name: dosa['name'],
      profileImageUrl: dosa['profileImageUrl'],
      email: dosa['email'],
      bio: dosa['bio'],
      isVerifiedUser: dosa['Is Verified'],
    );
  }
}
