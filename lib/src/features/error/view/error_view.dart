import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
  });
  final String error;

  static const String routeName = 'error';
  static Future<void> navigate(BuildContext context) =>
      GoRouter.of(context).pushNamed(routeName);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              '${l10n.errorViewText}: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: Text(l10n.errorViewButton),
          ),
        ],
      ),
    );
  }
}
