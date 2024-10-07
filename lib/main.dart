import 'package:bus_o_pedia/pages/homepage/homepage.dart';
import 'package:bus_o_pedia/themes/dark_light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    theme: lightMode,
    darkTheme: darkMode,
    home:  HomePage(),
    );
  }
}
