import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FirebaseInAppMessaging());
  }
}

class FirebaseInAppMessaging extends StatefulWidget {
  const FirebaseInAppMessaging({super.key});

  @override
  State<FirebaseInAppMessaging> createState() => _FirebaseInAppMessagingState();
}

class _FirebaseInAppMessagingState extends State<FirebaseInAppMessaging> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    final token = await _firebaseMessaging.getToken();
    print("token is $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In App messaging Demo'),
      ),
    );
  }
}
