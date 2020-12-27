import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String username;
  String email;
  String profileURL;
  int wins;
  int losses;

  User({
    this.uid,
    this.username,
    this.email,
    this.profileURL,
    this.wins,
    this.losses,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      uid: doc.id,
      username: doc.data()['username'],
      email: doc.data()['email'],
      profileURL: doc.data()['profileURL'],
      wins: doc.data()['wins'],
      losses: doc.data()['losses'],
    );
  }
}
