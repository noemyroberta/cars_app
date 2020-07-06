import 'package:cars/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(CarApp());

class CarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
