import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    //! screen size
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    //! Alert Dialog without icon
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

    //! Alert Dialog with icon
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

    //! Alert Dialog with custom design
    void showAlertDialogWithCustomDesign() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: const Text('Custom Alert Dialog'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'data 1',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    'https://ih1.redbubble.net/image.3266020083.4041/st,medium,507x507-pad,600x600,f8f8f8.jpg',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'In Flutter, displaying images from the network is achieved using the Image.network constructor.',
                    style: TextStyle(fontSize: 20, color: Colors.brown),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
      );
    }

    //! Simple Dialog
    void showSimpleDialog() {
      showDialog(
        context: context,
        //!dismissible: false means the dialog cannot be dismissed by tapping outside of it
        barrierDismissible: false,
        builder:
            (context) => SimpleDialog(
              title: const Text('Simple Dialog'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Option 1'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Option 2'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter text',
                      hintText: 'Enter text here',
                    ),
                  ),
                ),
                SimpleDialogOption(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('cancel'),
                  ),
                ),
              ],
            ),
      );
    }

    //! Bottom Sheet Alert
    void showBottomSheetAlert() {
      showModalBottomSheet(
        context: context,
        builder:
            (context) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('choose an option:', style: TextStyle(fontSize: 20)),
                  ListTile(
                    title: Text('Option 1'),
                    onTap: () {
                      print('Option 1 selected');
                    },
                  ),
                  ListTile(
                    title: Text('Option 2'),
                    onTap: () {
                      print('Option 2 selected');
                    },
                  ),
                  ListTile(title: Text('Option 3')),
                  ListTile(title: Text('Option 4')),
                  ListTile(title: Text('Option 5')),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ),
                  ),
                ],
              ),
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
            Container(
              height: screenHeight * 0.3,
              width: screenWidth / 2,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            //? Displaying text with different font sizes based on screen width
            Text(
              'data1',
              style: TextStyle(
                fontSize: screenWidth > 600 ? 20 : 50,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showSimpleDialog();
              },
              child: const Text('simple dialog'),
            ),
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
            ElevatedButton(
              onPressed: () {
                showAlertDialogWithCustomDesign();
              },
              child: const Text('Show Alert with custom design'),
            ),

            ElevatedButton(
              onPressed: () {
                showBottomSheetAlert();
              },
              child: const Text('Show bottomSheet Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
