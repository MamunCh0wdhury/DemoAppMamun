import 'package:flutter/material.dart';

import '../../weather_model/WeatherModel.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required WeatherModel? weather,
  }) : _weather = weather;

  final WeatherModel? _weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Weather Forecast\n ${_weather?.location!.name?.split(',')[0].trim() ?? " Loading city..."}, ${_weather?.location!.name!.split(',').last.trim() ?? "Loading country.."}',
      textAlign: TextAlign.center,
    );
  }
}