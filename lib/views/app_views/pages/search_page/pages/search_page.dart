import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/view_models/get_user.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Find Users',
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBar(
                onChanged: (value) {
                  searchController.text = value;
                  setState(() {});
                },
                hintText: 'Search by userName',
                elevation: MaterialStatePropertyAll(0.4),
                controller: searchController,
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: kSecondColor)),
                ),
                trailing: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.search_outlined))
                ],
              ),
              Expanded(
                child: FutureBuilder(
                    future: GetUser().getUser(userName: searchController.text),
                    builder: (context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length ?? 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: CustomText(
                                  text: snapshot.data[index]['userName']),
                              leading: CircleAvatar(),
                              subtitle: CustomText(text: '@user'),
                            );
                          });
                    }),
              ),
            ],
          ),
        ));
  }
}
