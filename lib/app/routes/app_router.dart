import 'package:alchemy/creation/creation.dart';
import 'package:alchemy/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
        transitionsBuilder: _fadeTransition,
      ),
    ),
    GoRoute(
      path: '/creation',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionDuration: const Duration(seconds: 1),
        child: const CreationPage(),
        transitionsBuilder: _fadeTransition,
      ),
    ),
  ],
);

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}
