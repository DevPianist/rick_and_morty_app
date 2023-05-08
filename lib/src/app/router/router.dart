import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/src/app/app.dart';
import 'package:rick_and_morty_app/src/features/home/home.dart';

mixin RouterMixin on State<App> {
  final _routerConfig = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            state.error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: HomeView.routeName,
        builder: (_, __) => const HomeView(),
      ),
    ],
  );
  GoRouter get routerConfig => _routerConfig;
}
