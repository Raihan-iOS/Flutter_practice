import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlertDialog() {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Alert Dialog'),
              content: const Text('This is an alert dialog'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }

    void showAlertDialogWithIcon() {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Alert Dialog'),
              icon: const Icon(Icons.warning, color: Colors.red),
              content: const Text('This is an alert dialog'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertDialog();
              },
              child: const Text('Show Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                showAlertDialogWithIcon();
              },
              child: const Text('Show Alert with icon'),
            ),
          ],
        ),
      ),
    );
  }
}
