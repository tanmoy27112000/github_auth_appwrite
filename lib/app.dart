import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:githubauth/login_screen.dart';

Client client = Client();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    client.setEndpoint('https://cloud.appwrite.io/v1').setProject('PROJECT-ID').setSelfSigned(status: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
