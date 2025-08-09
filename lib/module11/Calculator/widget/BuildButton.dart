import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  String buttonText;
  Color? buttonColor;
  final VoidCallback onPressed;

  BuildButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: buttonColor ?? Colors.grey.shade800,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(24),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
