import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/view/widget/feels_like.dart';
import 'package:weather_forecast/view/widget/location.dart';
import 'package:weather_forecast/weather_model/WeatherModelDaily.dart';
import 'package:weather_forecast/weather_model/WeatherModelHourly.dart';
import 'package:weather_forecast/weather_service/weather_service.dart';
import '../weather_model/WeatherModel.dart';
import 'widget/gradient_widget.dart';
import 'widget/temperature_widget.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool isLoading = false;
  final _weatherService = WeatherService('QDl0bmvUPSAhrJNB2U1hQ2ltQ2K5GfiM');

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

  /// Weather Description
  getWeatherDescription(weatherCode) {
    if (weatherCode == null) return 'Unknown';
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

  /// Weather Description Image
  getWeatherDescriptionImage(weatherCode) {
    if (weatherCode == null) return 'assets/description/clear_day.svg';
    switch (_weather?.data!.values!.weatherCode) {
      case 0:
        return 'assets/description/clear_day.svg';
      case 1000:
        return 'assets/description/clear_day.svg';
      case 1100:
        return 'assets/description/mostly_clear_day.svg';
      case 1101:
        return 'assets/description/partly_cloudy_day.svg';
      case 1102:
        return 'assets/description/mostly_cloudy.svg';
      case 1001:
        return 'assets/description/cloudy.svg';
      case 2000:
        return 'assets/description/fog.svg';
      case 2100:
        return 'assets/description/fog_light.svg';
      case 4000:
        return 'assets/description/drizzle.svg';
      case 4001:
        return 'assets/description/rain.svg';
      case 4200:
        return 'assets/description/rain_light.svg';
      case 4201:
        return 'assets/description/rain_heavy.svg';
      case 5000:
        return 'assets/description/snow.svg';
      case 5001:
        return 'assets/description/flurries.svg';
      case 5100:
        return 'assets/description/snow_light.svg';
      case 5101:
        return 'assets/description/snow_heavy.svg';
      case 6000:
        return 'assets/description/freezing_drizzle.svg';
      case 6001:
        return 'assets/description/freezing_rain.svg';
      case 6200:
        return 'assets/description/freezing_rain_light.svg';
      case 6201:
        return 'assets/description/freezing_rain_heavy.svg';
      case 7000:
        return 'assets/description/ice_pellets.svg';
      case 7101:
        return 'assets/description/ice_pellets_heavy.svg';
      case 7102:
        return 'assets/description/ice_pellets_light.svg';
      case 8000:
        return 'assets/description/tstorm.svg';
      default:
        return "Unknown";
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocationText(weather: _weather),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              /// Current Weather Condition
              GradientBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Temperature
                            Temperature(weather: _weather),

                            /// Weather Condition
                            Text(
                              getWeatherDescription(
                                  _weather?.data!.values!.weatherCode
                                       ),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF5F5F5),
                              ),
                            ),

                            /// Feels Like
                            FeelsLike(weather: _weather),

                            /// Perception
                            Text(
                              "Perception  ${_weather?.data!.values!.precipitationProbability}%",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF5F5F5),
                              ),
                            ),
                          ],
                        ),

                        /// Weather Condition Image
                        SvgPicture.asset(
                          getWeatherDescriptionImage(
                              _weather?.data!.values!.weatherCode
                                  ),
                          fit: BoxFit.contain,
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /// Hourly Weather Forecast
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        _weatherModelHourly?.timelines!.hourly!.length ?? 0,
                    itemBuilder: (context, index) {
                      String formattedTime =
                          _weatherModelHourly?.timelines?.hourly != null &&
                                  index >= 0 &&
                                  index <
                                      _weatherModelHourly!
                                          .timelines!.hourly!.length
                              ? DateFormat('H:mm').format(DateTime.parse(
                                  _weatherModelHourly!
                                      .timelines!.hourly![index].time
                                      .toString()))
                              : '';
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            /// Image
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.white10),
                              ),
                              child: SvgPicture.asset(
                                getWeatherDescriptionImage(_weather
                                    ?.data!.values!.weatherCode ),
                                height: 100,
                                width: 100,
                              ),
                            ),
                
                            /// Time
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                            ),
                
                            ///Temperature
                            Text(
                              "${_weatherModelHourly!.timelines!.hourly![index].values!.temperature!.round().toString()}°",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              /// Daily Weather Forecast
              Expanded(
                flex: 3,
                child: ListView.builder(
                    itemCount: _weatherModelDaily?.timelines!.daily!.length,
                    itemBuilder: (context, index) {
                      DateTime localTime = DateTime.parse(_weatherModelDaily
                              ?.timelines!.daily![index].time
                              .toString() ??
                          "");
                      String dayOfWeek =
                          DateFormat('EEEE').format(localTime);
                      return Container(
                        margin: const EdgeInsets.all(5),
                        height: 70,
                        width: 344,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff32D74B),
                                Color(0xff0D986A)
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.topLeft),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: SvgPicture.asset(
                              getWeatherDescriptionImage(_weather
                                  ?.data!.values!.weatherCode ),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          title: Text(dayOfWeek,style: const TextStyle(color: Colors.white),),
                          subtitle: Text(
                            getWeatherDescription(
                                _weather!.data!.values!.weatherCode.toString()),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF5F5F5),
                            ),
                          ),
                          trailing: Text(
                              style: const TextStyle(color: Colors.white,fontSize: 15),
                            "Min ${_weatherModelDaily?.timelines!.daily![index].values?.temperatureMin!.round().toString()}°C\n"
                            "Max ${_weatherModelDaily?.timelines!.daily![index].values?.temperatureMax!.round().toString()}°C",
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
    );
  }
}
