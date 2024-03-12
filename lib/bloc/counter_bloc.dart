import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<IncreaseEvent>(onNumberIncrease);
    on<DecreaseEvent>(onNumberDecrease);
  }

  void onNumberIncrease(IncreaseEvent event, Emitter<CounterState> emit) async {
    counter = counter + 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(DecreaseEvent event, Emitter<CounterState> emit) async {
    counter = counter - 1;
    emit(UpdateState(counter));
  }
}
