import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String weatherIcon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.weatherIcon,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      weatherIcon: jsonData['condition']['icon'],
    );
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow nearby' ||
        weatherStateName == 'Patchy sleet nearby' ||
        weatherStateName == 'Patchy freezing drizzle nearby' ||
        weatherStateName == 'Patchy light drizzle' ||
        weatherStateName == 'Light drizzle' ||
        weatherStateName == 'Freezing drizzle' ||
        weatherStateName == 'Heavy freezing drizzle' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Overcast' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Freezing fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Patchy light drizzle' ||
        weatherStateName == 'Patchy light rain' ||
        weatherStateName == 'Light rain' ||
        weatherStateName == 'Light drizzle' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Heavy rain at times' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Moderate rain at times') {
      return Colors.lightBlue;
    } else if (weatherStateName == 'Thundery outbreaks in nearby' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
