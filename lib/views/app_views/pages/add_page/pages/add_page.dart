import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/constants/constansts.dart';
import 'package:social_app/helper/awesome_dialog.dart';
import 'package:social_app/view_models/add_post.dart';
import 'package:social_app/helper/picked_image.dart';
import 'package:social_app/views/app_views/pages/add_page/widgets/custom_material_button.dart';
import 'package:social_app/views/auth/widgets/custom_text_button.dart';
import 'package:social_app/views/auth/widgets/custom_text_field.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Uint8List? file;
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Post'),
          actions: [
            CustomTextButton(
              textButton: 'Post',
              onPressed: () async {
                print(file);
                await AddPost().addPost(
                    file: file!,
                    userName: 'userName',
                    displayName: 'displayName',
                    uid: kUserAuth.currentUser!.uid,
                    description: description.text,
                    context: context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  Gap(10),
                  Expanded(
                      child: CustomTextField(
                    textEditingController: description,
                    color: Colors.white,
                    hintText: 'Type here ...',
                    maxLine: 5,
                  )),
                ],
              ),
              Expanded(
                  child: file == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: MemoryImage(file!),
                              )),
                        )),
              CustomMaterialButton(
                onPressed: () {
                  dialog(
                      context: context,
                      message: 'Choose Image',
                      dialogType: DialogType.question,
                      btnCancelOnPress: () async {
                        file = await SetImage().PickedImage(
                            source: ImageSource.gallery, context: context);
                        setState(() {});
                      },
                      btnCancelText: 'Gallery',
                      btnOkOnPress: () async {
                        file = await SetImage().PickedImage(
                            source: ImageSource.camera, context: context);
                        setState(() {});
                      },
                      btnOkText: 'Camera');
                },
                child: Icon(
                  Icons.camera,
                  color: kThirdColor,
                ),
              ),
              Gap(80)
            ],
          ),
        ));
  }
}
