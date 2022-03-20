// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Screens
import './screens/home_screen.dart';

// Widgets
import './widgets/add_alarm_widget.dart';

// Main Function
void main() {
  runApp(MyApp());
}

// MyApp StatelessWidget Class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/add-alarm': (BuildContext context) => AddAlarmWidget(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF1b2c57),
        accentColor: Color(0xFF65d1ba),
      ),
      home: HomeScreen(),
    );
  }
}