import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

const _initialState = HomeState(
  currentIndex: 0,
);

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_initialState) {
    on<ChangePage>(
      _onChangePage,
    );
  }

  void _onChangePage(
    ChangePage event,
    Emitter<HomeState> emit,
  ) {
    final newState = state.copyWith(currentIndex: event.index);
    emit(newState);
  }
}
