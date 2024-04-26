
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String email;
  final String displayName;
  final String uid;
  final String bio;
  final String profilePic;
  final List followers;
  final List following;

  UserModel(
      {required this.userName,
      required this.email,
      required this.displayName,
      required this.uid,
      required this.bio,
      required this.profilePic,
      required this.followers,
      required this.following});

  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return UserModel(
      userName: snapShot['userName'],
      email: snapShot['email'],
      displayName: snapShot['displayName'],
      uid: snapShot['uid'],
      bio: snapShot['bio'],
      profilePic: snapShot['profilePic'],
      followers: snapShot['followers'],
      following: snapShot['following'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'displayName': displayName,
        'uid': uid,
        'bio': bio,
        'profilePic': profilePic,
        'followers': followers,
        'following': following,
      };
}
