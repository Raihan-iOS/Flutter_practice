// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:widget_app_structure/peoject_cell_widget.dart';

class ProjectHome extends StatelessWidget {
  const ProjectHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                peoject_cell_widget(
                  serial: 1,
                  routeName: '/page5',
                  title: 'Calculator',
                ),
                SizedBox(height: 20),
                peoject_cell_widget(
                  serial: 2,
                  routeName: '/page6',
                  title: 'My Water Tank',
                ),
                SizedBox(height: 20),
                peoject_cell_widget(
                  serial: 3,
                  routeName: '/page7',
                  title: 'Money Management',
                ),
                SizedBox(height: 20),
                peoject_cell_widget(
                  serial: 4,
                  routeName: '/page8',
                  title: 'To-Do App',
                ),
                SizedBox(height: 20),
                peoject_cell_widget(
                  serial: 5,
                  routeName: '/page9',
                  title: 'CRUD App',
                ),
                // Add more buttons or widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
