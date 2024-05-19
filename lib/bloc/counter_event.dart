part of 'counter_bloc.dart';

abstract class CounterEvent {}
// sealed class CounterEvent {}
// Alternatively, we can also use a sealed class to control
// which other classes can extend it
// If we use sealed class, then in switch-case if I have
// forgotten to handle a type, then the compiler
// throws an error stating, you have not implemented an exhaustive
// matching.

// A final class prevents these classes from being extended
// Since in order to create a new event we should really be
// extending the CounterEvent class
final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}
