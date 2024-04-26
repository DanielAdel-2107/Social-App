import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:social_app/constants/constansts.dart';
import 'package:social_app/helper/awesome_dialog.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/view_models/upload_storage.dart';
import 'package:uuid/uuid.dart';

class AddPost {
  addPost({
    required Uint8List file,
    required String userName,
    required String displayName,
    required String uid,
    required String description,
    String? profilePic,
    required BuildContext context,
  }) async {
    try {
      String postImage =
          await UploadFirestoreImage().uploadImageToFirestor(file);
      String postId = Uuid().v1();
      PostModel postModel = PostModel(
        userName: userName,
        description: description,
        displayName: displayName,
        uid: kUserAuth.currentUser!.uid,
        postId: postId,
        profilePic: profilePic ?? '',
        postImage: postImage,
        like: [],
        dateTime: DateTime.now(),
      );
      kPostCollection.doc(postId).set(
            postModel.toJson(),
          );
    } catch (e) {
      dialog(
          context: context,
          message: e.toString(),
          dialogType: DialogType.warning);
    }
  }
}
