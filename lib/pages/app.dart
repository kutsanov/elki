import 'package:elki/models/house.dart';
import 'package:elki/pages/page_house.dart';
import 'package:elki/pages/page_houses.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/houses",
      routes: {
        '/houses': (BuildContext context) => const PageHouses(),
        //'/house': (BuildContext context) => PageHouse(),
      },
    );
  }
}
