import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/views/auth/widgets/custom_text.dart';

class HomePageListView extends StatelessWidget {
  const HomePageListView({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
                color: kThirdColor, borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    (data[index]['profilePic']) == null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(data[index]['profilePic']),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/man.png'),
                          ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: data[index]['displayName']),
                        CustomText(text: data[index]['userName']),
                      ],
                    ),
                    Spacer(),
                    CustomText(text: '${data[index]['userName']}')
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(data[index]['postImage']))),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(text: data[index]['description']),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                    CustomText(text: '0'),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                    CustomText(text: '0')
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
