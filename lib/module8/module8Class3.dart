import 'package:flutter/material.dart';

class Module8class3 extends StatelessWidget {
  const Module8class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gridview Example')),
      body: gridVwCount(),
    );
  }





  GridView gridVwCount() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,

      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.orange),
        Container(color: Colors.purple),
      ],
    );
  }
}
