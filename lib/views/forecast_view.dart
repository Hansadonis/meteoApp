import 'package:flutter/material.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/views/current_weather.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({Key? key, required this.response}) : super(key: key);

  final APIResponse? response;

  @override
  Widget build(BuildContext context) {
    return (response == null)
      ? Center(child: Text("No data"),)
      : Column(
      children: [
        CurrentWeather(forecast: response!.list.first),
      ],
    );
  }
}
