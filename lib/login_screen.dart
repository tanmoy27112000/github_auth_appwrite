// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:githubauth/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final account = Account(client);
              try {
                await account.createOAuth2Session(
                  provider: 'github',
                );
                Session session = await account.getSession(sessionId: 'current');
                if (session.current) {
                  //show success snackbar
                  print(session.provider);
                  print(session.providerUid);
                  print(session.providerAccessToken);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login Successful'),
                    ),
                  );
                }
              } catch (e) {
                //show error snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
              }
            },
            child: const Text('Login with Github'),
          ),
        ));
  }
}

// b1u3p0t@t0