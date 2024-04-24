import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_model/WeatherModel.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    super.key,
    required WeatherModel? weather,
  }) : _weather = weather;

  final WeatherModel? _weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_weather?.data!.values!.temperature!.round()}°C",
      style: const TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Color(0xffF5F5F5),
      ),
    );
  }
}