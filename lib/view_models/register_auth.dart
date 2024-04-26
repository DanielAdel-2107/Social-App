// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/constants/constansts.dart';
import 'package:social_app/models/user_mode.dart';
import 'package:social_app/helper/awesome_dialog.dart';

class RegisterAuth {
  RegisterWithEmail({
    required String emailAddress,
    required String password,
    required String displayName,
    required String userName,
    required BuildContext context,
  }) async {
    try {
      final credential = await kUserAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel user = UserModel(
        userName: userName,
        email: emailAddress,
        displayName: displayName,
        uid: credential.user!.uid,
        bio: '',
        profilePic: '',
        followers: [],
        following: [],
      );
      kUserCollection.doc(credential.user!.uid).set(user.toJson()).then(
          (value) => dialog(
              context: context,
              message: 'Register successfully',
              dialogType: DialogType.success));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        dialog(
            context: context,
            message: 'The password provided is too weak.',
            dialogType: DialogType.info);
      } else if (e.code == 'email-already-in-use') {
        dialog(
            context: context,
            message: 'The account already exists for that email.',
            dialogType: DialogType.info);
      }
    } catch (e) {
      dialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
