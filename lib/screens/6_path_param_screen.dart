import 'package:flutter/material.dart';
import 'package:flutter_gorouter_study/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PathParamScreen extends StatelessWidget {
  const PathParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Path Param : ${GoRouterState.of(context).pathParameters}'),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123/codefactory');
              // 뒤로가기 누르면  /path_param/123 으로 가짐
            },
            child: const Text('Path Param'),
          )
        ],
      ),
    );
  }
}
