import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_model/WeatherModel.dart';

class FeelsLike extends StatelessWidget {
  const FeelsLike({
    super.key,
    required WeatherModel? weather,
  }) : _weather = weather;

  final WeatherModel? _weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Feels Like  ${_weather?.data!.values!.temperatureApparent!.round()}°C",
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffF5F5F5)),
    );
  }
}