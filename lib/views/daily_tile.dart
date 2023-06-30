import 'package:flutter/material.dart';
import 'package:ma_meteo/model/data_converter.dart';
import 'package:ma_meteo/model/grouped_weather.dart';

class DailyTile extends StatelessWidget {
  DailyTile({Key? key, required this.day}) : super(key: key);
  GroupedWeather day;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor.withAlpha(90),
      elevation: 17,
      child: ListTile(
        trailing: Image.network(DataConverter().fromIcon(day.icon)),
        leading: Text(day.day),
        title: Text(day.description),
        subtitle: Text(day.minAndMax()),
      ),
    );
  }
}
