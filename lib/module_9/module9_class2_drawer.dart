import 'package:flutter/material.dart';
import 'package:widget_app_structure/module8/module8class1.dart';
import 'package:widget_app_structure/module8/module8class2.dart';
import 'package:widget_app_structure/module_9/class_1_alert.dart';

class Module9class2Drawer extends StatefulWidget {
  const Module9class2Drawer({super.key});

  @override
  State<Module9class2Drawer> createState() => _Module9class2DrawerState();
}

class _Module9class2DrawerState extends State<Module9class2Drawer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer Example'),
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),

        drawer: Drawer(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),

          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                      ),
                    ),
                    SizedBox(height: 10),

                    const Text(
                      'Dipto Toy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Text('dipto@newroz.com'),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(vertical: -4, horizontal: 0),
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                visualDensity: VisualDensity(vertical: -4, horizontal: 0),
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Balance'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.add_comment),
                title: const Text('Comment'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.people),
                title: const Text('Member'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.task),
                title: const Text('Task'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.pin_drop),
                title: const Text('Location'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.house),
                title: const Text('Address'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                dense: true,
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {},
              ),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Version : '), Text('1.0.0')],
                  ),
                  Text('Copyright 2023'),
                  Text('Contact Suport'),
                  InkWell(
                    child: Text(
                      '01617459005',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      print('call');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.red, child: Center(child: Text('Tab 1'))),
            // Container(
            //   color: Colors.yellow,
            //   child: Center(child: Text('Tab 2')),
            // ),
            // Container(color: Colors.teal, child: Center(child: Text('Tab 3'))),
            Module8class1(),
            Module8class2(),
          ],
        ),
      ),
    );
  }
}
