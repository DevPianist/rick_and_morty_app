part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class ChangePage extends HomeEvent {
  const ChangePage(this.index);

  final int index;
}
