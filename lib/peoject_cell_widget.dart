import 'package:flutter/material.dart';

class peoject_cell_widget extends StatelessWidget {
  final int serial;
  final String title;
  final String routeName;

  const peoject_cell_widget({
    super.key,
    required this.serial,
    required this.title,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName); // Navigate to MyCalculator
        },
        child: Text('Project $serial : $title', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
