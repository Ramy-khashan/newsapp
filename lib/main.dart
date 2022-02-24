import 'package:flutter/material.dart';
import 'package:newsapp/screens/bottombar/view.dart';
import 'package:newsapp/screens/flashscreen/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const FlashScreen(),
    );
  }
}
