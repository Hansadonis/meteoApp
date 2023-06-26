import 'package:flutter/material.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/data_converter.dart';

class CurrentWeather extends StatelessWidget {
  CurrentWeather({Key? key, required this.forecast}) : super(key: key);
  Forecast forecast;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height / 3,
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(DataConverter().fromIcon(forecast.weather.first.icon)),
                  Text("${forecast.main.temp.toInt()}°C",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              const Spacer(),
              Text(forecast.weather.first.description,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text("Min: ${forecast.main.temp_min.toInt()}°C - Max: ${forecast.main.temp_max.toInt()}°C",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
