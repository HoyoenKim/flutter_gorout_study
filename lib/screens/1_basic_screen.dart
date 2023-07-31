import 'package:flutter/material.dart';
import 'package:flutter_gorouter_study/layout/default_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text(
          'Basic Screen',
        ),
      ),
    );
  }
}
