import 'package:dairy/Admin_pannel/Admin_View.dart';
import 'package:dairy/Admin_pannel/ProductForm.dart';
import 'package:dairy/Admin_pannel/toggle.dart';
import 'package:dairy/Background/bg_change.dart';
import 'package:dairy/Background/image_change.dart';
import 'package:dairy/Screens/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ProductForm("1","dipti","250ml","20","500ml","45","1000ml","90"),
      home: Toggle(),
    );
  }
}