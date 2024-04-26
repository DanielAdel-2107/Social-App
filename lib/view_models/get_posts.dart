import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/constants/constansts.dart';

class GetPosts {
  List<Stream<QuerySnapshot>> data = [];
  getPosts() {
    Stream<QuerySnapshot> querySnapshot =
        kPostCollection.orderBy('dateTime', descending: true).snapshots();

    return querySnapshot;
  }
}
