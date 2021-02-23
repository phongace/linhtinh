import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:time_store/models/message/message.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
          ));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages.map(buildMessage).toList(),
    );
  }

  Widget buildMessage(Message message) {
    return ListTile(
      title: Text(
        message.title,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        message.body,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
