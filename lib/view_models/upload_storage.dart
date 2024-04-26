import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/constants/constansts.dart';
import 'package:uuid/uuid.dart';

class UploadFirestoreImage {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  
  uploadImageToFirestor(Uint8List file) async {
    String id = Uuid().v1();
    Reference ref = firebaseStorage
        .ref()
        .child('posts')
        .child('E8mqMJJBMMhq42CxyaznT60Zg1r2')
        .child(id);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
