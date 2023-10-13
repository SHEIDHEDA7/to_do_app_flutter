// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //Initialize Hive
  //Await and async are used as database is being used.
  await Hive.initFlutter();

  //Open a box, the box is like the representation of Database
  // ignore: unused_local_variable
  var box = await Hive.openBox("mybox");

  // Future.delayed(const Duration(seconds: 2));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.grey));
    /*This is Gonna help when we have multiple pages where App Bar will 
        be present, so that we dont have to enter the color multiple times*/
  }
}
