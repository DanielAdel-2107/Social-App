import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:social_app/app/social_app.dart';
import 'package:social_app/test1.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(NewWidget());
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
    final FirebaseMessaging firebaseMesage = FirebaseMessaging.instance;

  getToken() {
    firebaseMesage.getToken().then((token) {
      print(
          "========================================================== $token");
    });
  }

  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('================================');
        print(message.notification!.title);
        print(message.notification!.title);

        print('================================');
      }
    });
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Test1());
  }
}
