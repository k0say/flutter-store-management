part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncreaseEvent extends CounterEvent {}

class DecreaseEvent extends CounterEvent {}
