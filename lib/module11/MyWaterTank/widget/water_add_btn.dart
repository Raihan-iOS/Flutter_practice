import 'package:flutter/material.dart';

class waterAddButton extends StatelessWidget {
  final int waterAmount;
  IconData? waterIcon;
  final VoidCallback onPressed;
  // Default water amount

  waterAddButton({
    super.key,
    required this.waterAmount,
    required this.onPressed,
    this.waterIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(waterIcon ?? Icons.water_drop),
          label: Text(
            '$waterAmount LTR Water',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
