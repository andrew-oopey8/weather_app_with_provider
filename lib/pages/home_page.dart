import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.orangeAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName ?? '',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Updated: ${weatherData?.date.hour.toString() ?? ''}:${weatherData?.date.minute.toString() ?? ''}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                          'https:${weatherData?.weatherIcon.toString() ?? ''}'),
                      Text(
                        '${weatherData?.temp.toInt() ?? ''}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxtemp: ${weatherData?.maxTemp.toInt() ?? ''}',
                          ),
                          Text(
                            'mintemp: ${weatherData?.minTemp.toInt() ?? ''}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData?.weatherStateName ?? '',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
