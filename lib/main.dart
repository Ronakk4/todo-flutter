import 'package:flutter/material.dart';
import 'package:todoflutterandgo/screens/add_task.dart';
import 'package:todoflutterandgo/screens/all_task.dart';
import 'package:todoflutterandgo/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home:AllTask(),
    );
  }
}

