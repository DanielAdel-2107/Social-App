import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/views/app_views/app_views.dart';
import 'package:social_app/views/auth/login_screen/login_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SocialApp extends StatefulWidget {
  const SocialApp({super.key});

  @override
  State<SocialApp> createState() => _SocialAppState();
}

class _SocialAppState extends State<SocialApp> {
  // This widget is the root of your application.
  getToken() async {
    String? myToken = await FirebaseMessaging.instance.getToken();
    print('======================================================= $myToken');
  }

  @override
  void initState() {
    // TODO: implement initState
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true, appBarTheme: AppBarTheme(color: Colors.white)),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const AppView();
            } else {
              return const LoginScreen();
            }
          },
        ));
  }
}
