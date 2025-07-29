import 'package:flutter/material.dart';
import 'package:widget_app_structure/module8/module8Class3.dart';
import 'package:widget_app_structure/module8/module8class1.dart';
import 'package:widget_app_structure/module8/module8class2.dart';
import 'package:widget_app_structure/module8/stackpractice.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StackPractice(),
    );
  }
}
