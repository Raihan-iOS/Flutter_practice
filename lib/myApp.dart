import 'package:flutter/material.dart';
import 'package:widget_app_structure/module8/module8Class3.dart';
import 'package:widget_app_structure/module8/module8class1.dart';
import 'package:widget_app_structure/module8/module8class2.dart';
import 'package:widget_app_structure/module8/stackpractice.dart';
import 'package:widget_app_structure/module_9/alert.dart';
import 'package:widget_app_structure/module_9/module9_class2_drawer.dart';
import 'package:widget_app_structure/module_9/own_widget.dart';
import 'package:widget_app_structure/module_9/own_widget_implement.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // ✅ This sets your AppBar color
          foregroundColor: Colors.white, // Text/icon color
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
        ),
      ),
      home: OwnWidgetImplement(),
    );
  }
}
