import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/first_screen.dart';

void main() =>
  runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TAP design',
      theme: ThemeData(
        fontFamily: 'Halvetica',
        primaryColor: Color(0xFF050DAD),
      ),
      home: MyHomePage(),
    );
  }
}






