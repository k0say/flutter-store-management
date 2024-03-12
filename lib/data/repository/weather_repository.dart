import 'dart:convert';

import 'package:test_bloc/data/data_provider/weather_data_provider.dart';
import 'package:test_bloc/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Sammichele di Bari';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
