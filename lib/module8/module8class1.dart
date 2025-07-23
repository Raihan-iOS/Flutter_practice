import 'package:flutter/material.dart';

class Module8class1 extends StatelessWidget {
  const Module8class1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 8 Class 1'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Enter text here',

                prefixIcon: const Icon(Icons.phone, color: Colors.lightBlue),
                suffixIcon: Icon(Icons.check, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 163, 16, 41),
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 163, 16, 41),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter Password text',
                hintText: 'Enter password here',

                prefixIcon: const Icon(Icons.lock, color: Colors.lightBlue),
                suffixIcon: Icon(Icons.remove_red_eye, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 163, 16, 41),
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 163, 16, 41),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Phone: ${phoneNumberController.text}, Password: ${passwordController.text}',
                  ),
                ),
              );
            },
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              passwordController.clear();
              phoneNumberController.clear();
            },
            child: Text('Clear'),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 300,

            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Text('This is a container '),
          ),
        ],
      ),
    );
  }
}
