import 'package:flutter/material.dart';
import 'package:ma_meteo/model/geo_position.dart';

class MyDrawer extends StatelessWidget {

  GeoPosition? myPosition;
  List<String> cities;
  Function(String) onTap;

  MyDrawer({required this.myPosition, required this.cities, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final itemCount = (myPosition == null) ? cities.length + 1 : cities.length + 2;

    return Drawer(
      child: ListView.separated(
          itemBuilder: ((context, index) {
            if(index == 0) return header(context);
            if(index == 1 && myPosition != null) return tappable(myPosition!.city);
            if(myPosition == null) return tappable(cities[index - 1]);
            return tappable(cities[index - 2]);
          }),
          separatorBuilder: ((context, index) => const Divider()),
          itemCount: itemCount
      ),
    );
  }

  DrawerHeader header(BuildContext context){
    return DrawerHeader(
        child: Column(
          children: [
            Icon(Icons.location_city_outlined, size: 32, color: Theme.of(context).primaryColor,),
            Text("Mes ville"),
          ],
        ));
  }

  ListTile tappable(String string){
    return ListTile(
      title: Text(string),
      onTap: (() => onTap(string)),
    );
  }

}
