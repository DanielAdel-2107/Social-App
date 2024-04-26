import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String userName;
  final String description;
  final String displayName;
  final String uid;
  final String postId;
  final String profilePic;
  final String postImage;
  final dynamic like;
  final DateTime dateTime;
  PostModel(
      {required this.userName,
      required this.description,
      required this.displayName,
      required this.uid,
      required this.postId,
      required this.profilePic,
      required this.postImage,
      required this.like,
      required this.dateTime});

  factory PostModel.fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return PostModel(
      userName: snapShot['userName'],
      displayName: snapShot['displayName'],
      uid: snapShot['uid'],
      profilePic: snapShot['profilePic'],
      dateTime: snapShot['dateTime'],
      description: snapShot['description'],
      like: snapShot['like'],
      postImage: snapShot['postImage'],
      postId: snapShot['postId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'displayName': displayName,
        'uid': uid,
        'profilePic': profilePic,
        'dateTime': dateTime,
        'description': description,
        'like': like,
        'postImage': postImage,
        'postId': '',
      };
}
