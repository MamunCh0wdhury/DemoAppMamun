import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_forecast/weather_model/WeatherModelDaily.dart';
import 'package:weather_forecast/weather_model/WeatherModelHourly.dart';

import '../weather_model/WeatherModel.dart';

class WeatherService {
  /// URL & API Key for Current Weather


  static const baseurl = 'https://api.tomorrow.io/v4/weather/realtime';
  static const baseUrl = 'https://api.tomorrow.io/v4/weather/forecast';
  final String apiKey;

  WeatherService(this.apiKey);

  /// Api Call to Get Weather Condition of Current Location

  Future<WeatherModel> getWeather(String cityName) async {
    final response =
        await get(Uri.parse('$baseurl?location=$cityName&apikey=$apiKey'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Failed to load data");
    }
  }

  /// Method to Get Current Location

  Future<String> getCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    /// Current Location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    /// translate latitude and longitude coordinates into an address

    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placeMarks[0].locality;

    return city ?? "";
  }

  /// Api Call to Get Daily Weather Forecast of the Current location

  Future<WeatherModelDaily> getForecast(String cityName) async {
    final response = await get(Uri.parse(
        '$baseUrl?location=$cityName&timesteps=1d&apikey=$apiKey'));
    if (response.statusCode == 200) {
      return WeatherModelDaily.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Failed to load data");
    }
  }

  /// Api Call to Get Daily Weather Forecast of the Current location

  Future<WeatherModelHourly> getHourlyForecast(String cityName) async {
    final response = await get(Uri.parse(
        '$baseUrl?location=$cityName&timesteps=1h&apikey=$apiKey'));
    if (response.statusCode == 200) {
      return WeatherModelHourly.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
