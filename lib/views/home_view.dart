import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/geo_position.dart';
import 'package:ma_meteo/services/api_services.dart';
import 'package:ma_meteo/services/location_service.dart';
import 'package:ma_meteo/views/add_city_view.dart';
import 'package:ma_meteo/views/forecast_view.dart';
import 'package:ma_meteo/views/my_drawe.dart';
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
      drawer: MyDrawer(myPosition: userPosition, cities: [], onTap: onTap),
      body: Column(
        children: [
          AddCityView(onAddCity: onAddCity),
          Expanded(
              child: (apiResponse == null) ? NoDataView() : ForecastView(response: apiResponse!),
          )
        ],
      )


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

  onTap(String string){
    Navigator.of(context).pop();
  }

  onAddCity(String){

  }
}
