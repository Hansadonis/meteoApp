import 'dart:convert';

import 'package:http/http.dart';
import 'package:ma_meteo/model/api_response.dart';
import 'package:ma_meteo/model/geo_position.dart';
import 'package:ma_meteo/services/api_key_services.dart';

class ApiService{
  String baseUrl = "http://api.openweathermap.org/data/2.5/forecast";
  String lat = "lat=";
  String lon = "lon=";
  String appid = "appid=";
  String lang = "lang=fr";
  String units = "units=metric";

  String prepareQuert(GeoPosition geoPosition){
    final geoLat = geoPosition.lat;
    final geoLon = geoPosition.lon;
    return "$baseUrl?$lat$geoLat&$lon$geoLon&$units&$lang&$appid$API";
  }

  Future<APIResponse> callApi(GeoPosition position) async{
    final queryString = prepareQuert(position);
    final uri = Uri.parse(queryString);
    final call = await get(uri);
    Map<String, dynamic> map = json.decode(call.body);
    return APIResponse.fromJson(map);
  }
}