import 'package:flutter/material.dart';
import 'package:flutter_gorouter_study/layout/default_layout.dart';
import 'package:flutter_gorouter_study/route/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Login State : $authState'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(authState ? 'logout' : 'login'),
          ),
          ElevatedButton(
            onPressed: () {
              if (GoRouterState.of(context).uri.toString() == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
            child: const Text(
              'Go to Privarte Screen',
            ),
          ),
        ],
      ),
    );
  }
}
