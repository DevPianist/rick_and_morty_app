import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';

class TextException extends StatelessWidget {
  const TextException({super.key, required this.value});
  final Exception value;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    switch (value.runtimeType) {
      case OfflineException:
        return Text(l10n.errorViewText);
      case NullDataException:
      case ServerException:
      default:
        return Text(l10n.offlineText);
    }
  }
}
