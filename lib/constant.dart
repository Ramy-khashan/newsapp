import 'package:flutter/material.dart';

String apiKey = "9e9ddb07c53e423097e68651cfd4036c";
String baseUrl = "https://newsapi.org/";
String method = "v2/top-headlines";
String businessUrl =
    "country=eg&category=business&apiKey=$apiKey";
String healthUrl = "country=eg&category=health&apiKey=$apiKey";
String sportsUrl = "country=eg&category=sports&apiKey=$apiKey";
String generalUrl =
    "country=eg&category=general&apiKey=$apiKey";

Color mainColor = Color.fromARGB(255, 203, 45, 43);
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,
    primaryColor: mainColor);
ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: mainColor,
    primaryColor: mainColor);
