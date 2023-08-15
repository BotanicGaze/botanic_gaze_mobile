import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<bool> {
  CounterCubit() : super(false);

  // void increment() => emit(state + 1);
  // void decrement() => emit(state - 1);

  void changeLoading() => emit(!state);
}
