import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/view_models/get_posts.dart';
import 'package:social_app/views/app_views/pages/home_page/widgets/home_page_list_view.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '06',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: '16',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.chat))],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: GetPosts().getPosts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                var data = snapshot.data.docs;
                return HomePageListView(data: data);
              } else {
                return const Center(
                  child: CustomText(text: 'There is an error 😔😔'),
                );
              }
            }));
  }
}
