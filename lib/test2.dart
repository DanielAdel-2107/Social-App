import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:social_app/test1.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override


  void initState() {
    // TODO: implement initState
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
                        builder: (context) => Test1(),
                      ));
                },
                child: Text('to')),
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
