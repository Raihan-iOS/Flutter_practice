import 'package:flutter/material.dart';
import 'package:widget_app_structure/ProjectHome.dart';
import 'package:widget_app_structure/home.dart';
import 'package:widget_app_structure/module11/Calculator/mycalculator.dart';
import 'package:widget_app_structure/module11/MyWaterTank/watertank.dart';
import 'package:widget_app_structure/module12/money_management.dart';
import 'package:widget_app_structure/module12/todos/add_new_todo.dart';
import 'package:widget_app_structure/module12/todos/to_dos_app.dart';
import 'package:widget_app_structure/module13/crud%20app/screens/product_list_home.dart';
import 'package:widget_app_structure/module8/module8Class3.dart';
import 'package:widget_app_structure/module8/module8class1.dart';
import 'package:widget_app_structure/module8/module8class2.dart';
import 'package:widget_app_structure/module8/stackpractice.dart';
import 'package:widget_app_structure/module_9/AdvanceNav/first_page.dart';
import 'package:widget_app_structure/module_9/AdvanceNav/fourth_page.dart';
import 'package:widget_app_structure/module_9/AdvanceNav/second_page.dart';
import 'package:widget_app_structure/module_9/AdvanceNav/third_page.dart';
import 'package:widget_app_structure/module_9/class_1_alert.dart';
import 'package:widget_app_structure/module_9/module9_class2_drawer.dart';
import 'package:widget_app_structure/module_9/module9class3.dart';
import 'package:widget_app_structure/module_9/own_widget/own_widget.dart';
import 'package:widget_app_structure/module_9/own_widget/own_widget_implement.dart';

import 'module_9/AdvanceNav/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => ProjectHome(), //HomePage(),
        '/page1': (context) => FirstPage(),
        '/page2': (context) => SecondPage(),
        '/page3': (context) => ThirdPage(),
        '/page4': (context) => FourthPage(),
        '/page5': (context) => MyCalculator(),
        '/page6': (context) => Watertank(),
        '/page7': (context) => MoneyManagement(),
        '/page8': (context) => ToDosApp(),
        '/page9': (context) => ProductListHome(),
      },
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
      //! Use later

      //    theme: ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.purple,
      //   primarySwatch: Colors.teal,
      //   scaffoldBackgroundColor: Colors.grey.shade100,

      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.deepOrange,
      //       foregroundColor: Colors.white,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8)
      //       )
      //     )
      //   ),

      //   inputDecorationTheme: InputDecorationTheme(
      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: Colors.deepPurple,
      //         width: 1,
      //       ),
      //     ),
      //     hintStyle: TextStyle(
      //       color: Colors.deepPurple,
      //     ),

      //     labelStyle: TextStyle(
      //       color: Colors.deepPurple
      //     )
      //   )
      // ),

      //home: OwnWidgetImplement(),
    );
  }
}
