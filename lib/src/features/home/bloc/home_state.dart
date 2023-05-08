part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  HomeState copyWith({
    int? currentIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
