import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma_meteo/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();//assurer l,innitialisation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //vouloir uniquement en portrait

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homeview(),
    );
  }
}
