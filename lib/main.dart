import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_dashboard_app_tut/screens/HomePage.dart';
import 'package:web_dashboard_app_tut/screens/Welcome.dart';
import 'package:web_dashboard_app_tut/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
