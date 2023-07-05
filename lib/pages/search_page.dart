import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onSubmitted: (data)async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel weather= await service.getWeather(cityName: cityName!);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              border: OutlineInputBorder(),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
