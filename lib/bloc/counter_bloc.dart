import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:learning_flutter_bloc/bloc/counter_event.dart';
// Instead of importing the counter_event.dart file, we can
// instead tell Dart that counter_event.dart is a part of this file

part 'counter_event.dart';

// Another advantage is that, we no longer need to import
// "counter_event.dart" from all classes that fires an event
// We can simply import counter_bloc.dart and since
// "counter_event.dart" is a part-of counter_bloc.dart
// All of the things available in counter_event.dart
// is automatically available after importing counter_bloc.dart

// Bloc expects an Event and a State
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // For Bloc we require event handlers
    // All the event handlers are registered in the
    // constructor of the Bloc class

    // 1. Event Handler for CounterIncremented
    // In Bloc, emit cannot be used outside of the
    // Event Handler
    on<CounterIncremented>(
      (event, emit) {
        // state is the getter that comes from the Bloc class
        emit(state + 1);
      },
    );

    // 2. Event Handler for CounterDecremented
    // In Bloc, emit cannot be used outside of the
    // Event Handler
    on<CounterDecremented>(
      (event, emit) {
        if (state == 0) {
          return;
        }
        // state is the getter that comes from the Bloc class
        emit(state - 1);
      },
    );
  }
}
