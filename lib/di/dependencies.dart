import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dependencies {
  const Dependencies({
    required this.characterRepository,
  });
  final CharacterRepository characterRepository;
}

extension XDependencies on BuildContext {
  Dependencies get dependencies => read<Dependencies>();
}
