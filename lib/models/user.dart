import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });
  String name;
  String profilePhoto;
  String email;
  String uid;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
