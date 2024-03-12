import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:test_bloc/data/repository/weather_repository.dart';
import 'package:test_bloc/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> state,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
