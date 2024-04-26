import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:social_app/test2.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  sendNotification();
                },
                child: Text('Send')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Test2(),
                      ));
                },
                child: Text('to 2')),
          ],
        ),
      ),
    );
  }

  sendNotification() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAANN1N0uw:APA91bGWgNwpSuFQN40nTYT9UXr6NBqHgcXvrh9m06IfTNRgfOgDRI5z5iPOqeScxy5Zwev9nmkuOLnl4zmjZpChVJR9K0nmEiaaXK1QlG7vHP3cZKbdZBM6nSwJZQpqZW43N-Vfc5yS'
    };
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var body = {
      "to":
          "fVOF5B91Qaqpd4F7-raxgg:APA91bEQ_aOKRdWYjpqAcJH5zv3wdhakv3CtJ2Ig4nRRjfPS0UidToGx3cDjYo48pycN0JxhJXSBERkFooEShgDK-YzrmhpoW90dM13RBrjxZQU9FlXS5ZrQkerJPhWtI9arZZbqNabA",
      "notification": {
        "title": "Check this Mobile (title)",
        "body": "Rich Notification testing (body)",
        "mutable_content": true,
        "sound": "Tri-tone"
      }
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }
}
