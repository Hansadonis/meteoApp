import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/model/geo_position.dart';
import 'package:ma_meteo/services/api_services.dart';
import 'package:ma_meteo/services/location_service.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);
  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {

  GeoPosition? userPosition;

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
      body: Center(child: Text("Notre position est: \n ${userPosition?.lat} \n ${userPosition?.lon}"),),
    );
  }

  getUserLocation() async{
    final loc = await LocationService().getCity();
    if(loc != null){
      userPosition = loc;
      ApiService().callApi(userPosition!);
    }
  }

}
