import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('에러')),
      body: ListView(children: [
        Text('Error $error'),
        ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('홈으로'))
      ]),
    );
  }
}
