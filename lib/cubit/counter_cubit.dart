import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // Sets the initial state as 0
  CounterCubit() : super(0);

  void increment() {
    // state is a getter, therefore statements like below
    // is not allowed
    // state += 1;

    // emit() updates the state to the provide state
    emit(state + 1);
  }

  void decrement() {
    if (state == 0) {
      return;
    }

    // Please note, emit() method is a protected method
    // therefore can only be called from inside the class
    // that extends Cubit and cannot be called from
    // outside the sub classes of Cubit
    emit(state - 1);
  }
}
