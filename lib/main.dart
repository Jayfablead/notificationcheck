import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notificationcheck/firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Notification/push_notification_services.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      // Request notification permission if not granted
      await Permission.notification.request();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getToken();
  }
void getToken ()async{
  PushNotificationServices pushservice = PushNotificationServices();
  String serverToken = await pushservice.getAccessToken();
  print(serverToken);
}
  // Future<String?> CheckToken() async {
  //   // FirebaseMessaging.instance.requestPermission();
  //   FirebaseMessaging _firebaseMessaging =
  //       FirebaseMessaging.instance; // Change here
  //   _firebaseMessaging.getToken().then((token) async {
  //     print('Tkn : ${token}');
  //     SharedPreferences preftoken = await SharedPreferences.getInstance();
  //     preftoken.setString("token", token!);
  //
  //     // PushNotificationServices.sendNotification(token, context);
  //   });
  //   await AwesomeNotifications()
  //       .isNotificationAllowed()
  //       .then((isAllowed) async {
  //     if (!isAllowed) {
  //       await AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Notification Check'),
      ),
      body: Center(
        child: Text('Click On Notification Button And Get Notify'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getToken();
          debugPrint('Ding Dong Notification Button Clicked');
        },
        child: Icon(Icons.notification_add_sharp),
      ),
    );
  }
}
