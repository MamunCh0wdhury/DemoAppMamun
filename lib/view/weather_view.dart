import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/weather_model/WeatherModelDaily.dart';
import 'package:weather_forecast/weather_model/WeatherModelHourly.dart';
import 'package:weather_forecast/weather_service/weather_service.dart';
import '../weather_model/WeatherModel.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool isLoading = false;
  final _weatherService = WeatherService();

  /// built Weather Model Class Object
  WeatherModel? _weather;
  WeatherModelDaily? _weatherModelDaily;
  WeatherModelHourly? _weatherModelHourly;

  /// Get Current City Weather Condition
  fetchWeather() async {
    String cityName = await _weatherService.getCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
      isLoading = false;
    } catch (e) {
      e.toString();
    }
  }

  /// Get Daily Weather Forecast of Current Location
  fetchForecast() async {
    String cityName = await _weatherService.getCity();
    try {
      final weatherForecast = await _weatherService.getForecast(cityName);
      setState(() {
        _weatherModelDaily = weatherForecast;
      });
      isLoading = false;
    } catch (e) {
      e.toString();
    }
  }

  /// Get Hourly Weather Forecast of Current Location
  fetchHourlyForecast() async {
    String cityName = await _weatherService.getCity();
    try {
      final weatherHourlyForecast =
          await _weatherService.getHourlyForecast(cityName);
      setState(() {
        _weatherModelHourly = weatherHourlyForecast;
      });
      isLoading = false;
    } catch (e) {
      e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    fetchWeather();
    fetchForecast();
    fetchHourlyForecast();
  }

  /// Weather Code
  String getWeatherDescription(int weatherCode) {
    switch (_weather?.data!.values!.weatherCode) {
      case 0:
        return "Unknown";
      case 1000:
        return "Clear, Sunny";
      case 1100:
        return "Mostly Clear";
      case 1101:
        return "Partly Cloudy";
      case 1102:
        return "Mostly Cloudy";
      case 1001:
        return "Cloudy";
      case 2000:
        return "Fog";
      case 2100:
        return "Light Fog";
      case 4000:
        return "Drizzle";
      case 4001:
        return "Rain";
      case 4200:
        return "Light Rain";
      case 4201:
        return "Heavy Rain";
      case 5000:
        return "Snow";
      case 5001:
        return "Flurries";
      case 5100:
        return "Light Snow";
      case 5101:
        return "Heavy Snow";
      case 6000:
        return "Freezing Drizzle";
      case 6001:
        return "Freezing Rain";
      case 6200:
        return "Light Freezing Rain";
      case 6201:
        return "Heavy Freezing Rain";
      case 7000:
        return "Ice Pellets";
      case 7101:
        return "Heavy Ice Pellets";
      case 7102:
        return "Light Ice Pellets";
      case 8000:
        return "Thunderstorm";
      default:
        return "Unknown";
    }
  }

  /// Convert Time String

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Current Weather Condition
                const Text(
                  "Current Weather Forecast",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey),
                ),
                const SizedBox(height: 10,),
                Text(
                  _weather!.location!.name ?? "Loading city",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Currently  ${_weather!.data!.values!.temperature!.round()}°C",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  getWeatherDescription(
                      _weather?.data!.values!.weatherCode as int),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Feels Like  ${_weather?.data!.values!.temperatureApparent!.round()}°C",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Daily Weather Forecast ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.grey),
                ),

                /// Daily Weather Forecast
                Expanded(
                  child: ListView.builder(
                      itemCount: _weatherModelDaily?.timelines!.daily!.length,
                      itemBuilder: (context, index) {
                        DateTime localTime = DateTime.parse(_weatherModelDaily
                                ?.timelines!.daily![index].time
                                .toString() ??
                            "");
                        String dayOfWeek = DateFormat('EEEE').format(localTime);
                        return ListTile(
                          title: Text(dayOfWeek),
                          subtitle: Text(
                              "Temperature Avg ${_weatherModelDaily?.timelines!.daily![index].values?.temperatureAvg.toString()}°C"),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hourly Weather Forecast ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.grey),
                ),

                /// Hourly Weather Forecast
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          _weatherModelHourly?.timelines!.hourly!.length ?? 0,
                      itemBuilder: (context, index) {
                        String formattedTime =
                            _weatherModelHourly?.timelines?.hourly != null &&
                                    index >= 0 &&
                                    index <
                                        _weatherModelHourly!
                                            .timelines!.hourly!.length
                                ? DateFormat('h:mm a').format(DateTime.parse(
                                    _weatherModelHourly!
                                        .timelines!.hourly![index].time
                                        .toString()))
                                : '';

                        return ListTile(
                          leading: Text(
                            formattedTime,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          title: Text(
                            "Current ${_weatherModelHourly!.timelines!.hourly![index].values!.temperature.toString()}°C",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            "Feels Like ${_weatherModelHourly!.timelines!.hourly![index].values!.temperatureApparent.toString()}°C",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
