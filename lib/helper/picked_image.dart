import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/helper/awesome_dialog.dart';

class SetImage {
  PickedImage(
      {required ImageSource source, required BuildContext context}) async {
    try {
      final ImagePicker picker = ImagePicker();
// Pick an image.
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return await image.readAsBytes();
      } else {
        dialog(
            context: context,
            message: 'You did not choose a picture',
            dialogType: DialogType.info);
      }
    } catch (e) {
      dialog(
          context: context,
          message: 'You did not choose a picture',
          dialogType: DialogType.info,);
    }
  }
}
