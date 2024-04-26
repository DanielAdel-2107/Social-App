import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/constants/constansts.dart';

class GetUser {
  getUser({required String userName}) async {
    List<QueryDocumentSnapshot> data = [];
    QuerySnapshot querySnapshot = await kUserCollection
        .where(
          'userName',
          isEqualTo: userName,
        )
        .get();
    data.addAll(querySnapshot.docs);
    return data;
  }
}
