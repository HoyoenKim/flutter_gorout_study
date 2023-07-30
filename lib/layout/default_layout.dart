import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  const DefaultLayout({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'route',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: body,
      ),
    );
  }
}
