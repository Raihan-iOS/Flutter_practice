// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OwnWidget extends StatelessWidget {
  final String title;

  const OwnWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAdGdsfWdvPwatwii1lIReJEVX_4jrpSIqdg&s',
              ),
            ),
            Positioned(
              bottom: 16,
              left: 20,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
