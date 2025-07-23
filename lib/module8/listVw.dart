import 'package:flutter/material.dart';

class Listvw extends StatefulWidget {
  final String name;
  const Listvw({super.key, required this.name});

  @override
  State<Listvw> createState() => _ListvwState();
}

class _ListvwState extends State<Listvw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Example - ${widget.name}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (comtext, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text('Item $index'),
              subtitle: Text('Subtitle for item $index'),
            ),
          );
        },
      ),
    );
  }
}
