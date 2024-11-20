import 'package:flutter/material.dart';
import 'package:hiremi_project/New%20folder/LoginScreen.dart';
import 'package:hiremi_project/New%20folder/RegistrationScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreenUpdated() ,
    );
  }
}