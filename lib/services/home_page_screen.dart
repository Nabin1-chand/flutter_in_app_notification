import 'package:flutter/material.dart';
import 'package:flutter_notification/services/remote_config_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final remoteConfig = FirebaseRemoteConfigService();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          remoteConfig.getString(FirebaseRemoteConfigKeys.welcomeMessage),
          textAlign: TextAlign.center,
        ),
        // child: Text('Hello'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        remoteConfig.fetchAndActivated();
        setState(() {});
      }),
    );
  }
}
