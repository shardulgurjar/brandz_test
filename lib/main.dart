import 'package:brandz_test/BottomAppBar/BottomAppBar.dart' as navBar;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brandz Garage Test',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: navBar.BottomAppBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

