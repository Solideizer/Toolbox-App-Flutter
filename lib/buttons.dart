import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final double fontSize;
  final buttonTapped;

  MyButton(
      {this.color,
      this.textColor,
      this.buttonText,
      this.fontSize,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
