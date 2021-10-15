

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonwhite/screens/cart_screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home:CartScreen(),
    );
  }
}
