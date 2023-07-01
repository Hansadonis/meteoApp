import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/geo_position.dart';
import 'package:ma_meteo/services/api_services.dart';
import 'package:ma_meteo/services/data_services.dart';
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
  GeoPosition? positionToCall;

  List<String> cities = [];
  APIResponse? apiResponse;

  @override
  void initState() {
    getUserLocation();
    updateCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(positionToCall?.city ?? "Ma meteo"),
      ),
      drawer: MyDrawer(
          myPosition: userPosition,
          cities: cities,
          onTap: onTap,
          onDelete: removeCity,
      ),
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

  //Obtenir position via GPS
  getUserLocation() async{
    final loc = await LocationService().getCity();
    if(loc != null){
      setState(() {
        userPosition = loc;
        positionToCall = loc;
      });
      callApi();
    }
  }
  //CallApi
  callApi() async{
    if(positionToCall == null) return;
    apiResponse = await ApiService().callApi(positionToCall!);
    setState(() {
    });
  }
  //Nouvelle ville
  onTap(String string) async{
    if(string == userPosition?.city){
      positionToCall = userPosition;
      callApi();
    } else{
      positionToCall = await LocationService().getCoordsFromCity(string);
      callApi();
    }
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  //Ajouter
  onAddCity(String string){
    DataServices().addCity(string).then((onSuccess) => updateCities());
  }

  //Supprimer
  removeCity(String string) async{
    DataServices().removeCity(string).then((onSuccess) => updateCities());
  }

  //Mettre a jour les villes
  updateCities() async{
    cities = await DataServices().getCities();
    setState(() {});
  }
}
