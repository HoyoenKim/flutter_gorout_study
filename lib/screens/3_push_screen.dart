import 'package:flutter/material.dart';
import 'package:flutter_gorouter_study/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              // 뒤로가면 /push로 가진다.
              context.push('/basic');
            },
            child: const Text('Push Basic'),
          ),
          ElevatedButton(
            onPressed: () {
              // go는 /push 위에 /basic이 생기는 게 아니라 / 위에 /basic이 생겨 뒤로가면 /로 가진다.
              // 선언 그대로 라우터를 다시 생성한다.
              context.go('/basic');
            },
            child: const Text('Go Basic'),
          )
        ],
      ),
    );
  }
}
