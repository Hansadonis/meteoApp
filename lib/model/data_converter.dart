class DataConverter{
  List<Map<String, dynamic>> listMappable(List<dynamic> list){
    return list.map((e) => e as Map<String, dynamic>).toList();
  }

  String fromIcon(String string){
    return "https://openweathermap.org/img/wn/$string@2x.png";
  }

}