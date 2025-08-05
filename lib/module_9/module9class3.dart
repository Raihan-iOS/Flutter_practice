import 'package:flutter/material.dart';

class Module9class3 extends StatelessWidget {
  const Module9class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 9 Class 3'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('home 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/module9Class1');
              },
              child: const Text('Class 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/module9Class2');
              },
              child: const Text('class 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/module9Class3');
              },
              child: const Text('class 3'),
            ),
          ],
        ),
      ),
    );
  }
}
