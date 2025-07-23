import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: SizedBox(
                height: 50.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Button 1'),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Button 2')),
            ElevatedButton(onPressed: () {}, child: Text('Button 3')),
            ElevatedButton(onPressed: () {}, child: Text('Button 4')),
            ElevatedButton(onPressed: () {}, child: Text('Button 5')),
            GestureDetector(
              onTap: () {
                print("image Tapped");
              },
              child: Icon(Icons.home, size: 50.0, color: Colors.deepPurple),
            ),
            InkWell(
              onTap: () {
                print("inkwell star");
              },
              child: Icon(Icons.star, size: 50.0, color: Colors.deepPurple),
            ),
            IconButton(
              onPressed: () {
                print("icon button pressed");
              },
              icon: Icon(Icons.home_repair_service),
              color: Colors.deepPurple,
              iconSize: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              
              child: InkWell(
                onTap: () {
                  print("inkwell Hello, Flutter!");
                },
                child: Text(
                  "Hello, Flutter!Hello, Flutter!Hello, Flutter!Hello, Flutter!",
                  style: TextStyle(fontSize: 24, color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
