import 'package:flutter/material.dart';

String apiKey = "9e9ddb07c53e423097e68651cfd4036c";
String businessUrl =
    "https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=$apiKey";
String healthUrl =
    "https://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=$apiKey";
String sportsUrl =
    "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=$apiKey";
String generalUrl =
    "https://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=$apiKey";

Color mainColor = Colors.teal.shade800;
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.white,
    primaryColor: mainColor);
ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: mainColor,
    primaryColor: mainColor);
