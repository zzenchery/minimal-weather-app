import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather_app/models/weather_model.dart';
import 'package:the_weather_app/services/weather_services.dart';
import "package:lottie/lottie.dart";

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('855bb42417410593105dee982388c74f');

  Weather? _weather;

  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();
  

  try{
    final weather = await _weatherService.getWeather(cityName);
    setState(() {
      _weather = weather;
    });
  }catch(e){
    print(e);
  }
}
@override
  void initState() {
    
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(_weather?.cityName ?? "loading city..."),

        Lottie.asset('assets/cloud.json'),

        Text("${_weather?.temperature.round()}°C")
      ],
      )
      )
    ); 
  }
}