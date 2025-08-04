import 'package:flutter/material.dart';
import 'package:widget_app_structure/module_9/own_widget/own_widget.dart';

class OwnWidgetImplement extends StatelessWidget {
  const OwnWidgetImplement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Own Widget Implement'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OwnWidget(title: 'First'),
                    SizedBox(width: 8),
                    OwnWidget(title: 'Second'),
                    SizedBox(width: 8),
                    OwnWidget(title: 'Third'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
