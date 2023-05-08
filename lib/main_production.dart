import 'package:data/data.dart';
import 'package:rick_and_morty_app/bootstrap.dart';
import 'package:rick_and_morty_app/di/dependencies.dart';
import 'package:rick_and_morty_app/src/app/app.dart';

void main() {
  bootstrap(
    () => App(
      dependencies: Dependencies(
        characterRepository: remoteCharacterRepository,
      ),
    ),
  );
}
