import 'package:flutter/material.dart';

class ImageDetailsPage extends StatelessWidget {
  final String imagePath;

  ImageDetailsPage({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
