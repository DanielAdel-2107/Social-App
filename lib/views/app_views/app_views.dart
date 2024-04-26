import 'package:flutter/material.dart';
import 'package:social_app/constants/app_color.dart';
import 'package:social_app/constants/constansts.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: buildNavigationBar(),
        body: PageView(
          controller: pageController,
          children: [
            kPagesList[currentIndex],
          ],
          onPageChanged: (value) {
            currentIndex = value;
            pageController.jumpToPage(currentIndex);
            setState(() {});
          },
        ));
  }

  NavigationBar buildNavigationBar() {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.search_outlined), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.add), label: 'Add'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
      backgroundColor: kThirdColor.withOpacity(0.8),
      indicatorColor: kPrimaryColor.withOpacity(0.2),
      elevation: 0.0,
      selectedIndex: currentIndex,
      onDestinationSelected: (value) {
        currentIndex = value;
        setState(() {});
      },
    );
  }
}
