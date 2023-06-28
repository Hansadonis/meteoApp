import 'package:flutter/material.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/data_converter.dart';
import 'package:ma_meteo/model/grouped_weather.dart';
import 'package:ma_meteo/views/current_weather.dart';
import 'package:ma_meteo/views/daily_tile.dart';

class ForecastView extends StatelessWidget {
  ForecastView({required this.response});

  final APIResponse response;

  @override
  Widget build(BuildContext context) {
    List<GroupedWeather> byDay = DataConverter().byDay(response);
    return Column(
      children: [
        CurrentWeather(forecast: response!.list.first),
        Expanded(child: ListView.separated(
            itemBuilder: ((context, index) => DailyTile(day: byDay[index])),
            separatorBuilder: ((c, i) => const Divider()),
            itemCount: byDay.length))
      ],
    );
  }
}
