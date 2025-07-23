import 'package:flutter/material.dart';
import 'package:widget_app_structure/module8/listVw.dart';

class Module8class2 extends StatelessWidget {
  const Module8class2({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Module 8 Class 2'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('asset/FastPay.webp'),
            Image.network(
              'https://img.drz.lazcdn.com/static/bd/p/12698abaab249b78ff0930cfcbefd97b.jpg_720x720q80.jpg_.webp',
            ),
            SizedBox(height: 20),
            Text(
              'Log into your account',
              style: TextStyle(fontSize: 24, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Process the login
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Logging in...')),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Listvw(
                                  name: 'move from module 8 class 2',
                                );
                              },
                            ),
                          ); // Navigate to Listvw
                        }
                      },
                      child: Text('Login'),
                    ), // ElevatedButton(onPressed: (), child: child)
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
