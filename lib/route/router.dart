import 'package:flutter/material.dart';
import 'package:flutter_gorouter_study/screens/10_transition_screen1.dart';
import 'package:flutter_gorouter_study/screens/10_transition_screen2.dart';
import 'package:flutter_gorouter_study/screens/1_basic_screen.dart';
import 'package:flutter_gorouter_study/screens/2_named_screen.dart';
import 'package:flutter_gorouter_study/screens/3_push_screen.dart';
import 'package:flutter_gorouter_study/screens/4_pop_base_screen.dart';
import 'package:flutter_gorouter_study/screens/5_pop_return_screen.dart';
import 'package:flutter_gorouter_study/screens/6_path_param_screen.dart';
import 'package:flutter_gorouter_study/screens/7_query_param_screen.dart';
import 'package:flutter_gorouter_study/screens/8_nested_child_screen.dart';
import 'package:flutter_gorouter_study/screens/8_nested_screen.dart';
import 'package:flutter_gorouter_study/screens/9_login_screen.dart';
import 'package:flutter_gorouter_study/screens/9_private_screen.dart';
import 'package:flutter_gorouter_study/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/11_error_screen.dart';

// 로그인 여부
bool authState = false;

final router = GoRouter(
  redirect: (context, state) {
    if (state.location == '/login/private' && !authState) {
      // return path -> 해당 라우트로 이동
      // return null -> 원래 이동하려던 곳으로 이동
      return '/login';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootScreen();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return const PushScreen();
          },
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return const PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return', // /pop/return
              builder: (context, state) {
                return const PopReturnScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return const QueryParamScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            // /nested/a
            GoRoute(
              path: 'nested/a',
              builder: (context, state) {
                return const NestedChildScreen(
                  routeName: '/nested/a',
                );
              },
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) {
                return const NestedChildScreen(
                  routeName: '/nested/b',
                );
              },
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) {
                return const NestedChildScreen(
                  routeName: '/nested/c',
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => const PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (_, state) => const PrivateScreen(),
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => const TransitionScreen1(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                child: const TransitionScreen2(),
                transitionDuration: const Duration(
                  seconds: 3,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // animation: 0 -> 1 로 증가
                  // secondaryAnimation: 1 -> 0 으로 감소
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                  //return ScaleTransition(
                  //  scale: animation,
                  //  child: child,
                  //);
                  //return RotationTransition(
                  //  turns: animation,
                  //  child: child,
                  //);
                },
              ),
            ),
          ],
        )
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);
