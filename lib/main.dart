import 'package:bmi2/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi2/home.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugDisableShadows,
      //debugShowMaterialGrid: true,
      title: 'Flutter bmi',
      theme: ThemeData(
          iconTheme: const IconThemeData(
              color: Color(0xff080412)),
          textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff84B7EE)))),
      home:  const MyHomePage(title: 'main_page',),
    );
  }
}