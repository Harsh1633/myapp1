import 'package:flutter/material.dart';
import 'package:myapp1/screens/home.dart';
import 'package:myapp1/screens/information/info.dart';


void main() {
  runApp(
    MaterialApp(
      // initialRoute: '/info',
      home: Home(),
    routes: {
      '/home': (context) => Home(),
      '/info': (context) => Welcome()
    },),
  );
}



