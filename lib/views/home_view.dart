import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/geo_position.dart';
import 'package:ma_meteo/services/api_services.dart';
import 'package:ma_meteo/services/location_service.dart';
import 'package:ma_meteo/views/forecast_view.dart';
import 'package:ma_meteo/views/no_data_view.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);
  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

  GeoPosition? userPosition;
  APIResponse? apiResponse;

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(userPosition?.city ?? "Ma meteo"),
      ),
      body: (apiResponse == null) ? NoDataView() : ForecastView(response: apiResponse!),
    );
  }

  getUserLocation() async{
    final loc = await LocationService().getCity();
    if(loc != null){
      setState(() {
        userPosition = loc;

      });
      apiResponse = await ApiService().callApi(userPosition!);
      setState(() {
      });
    }

  }

}
