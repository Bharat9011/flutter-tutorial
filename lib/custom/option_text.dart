import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionText extends StatelessWidget {
  OptionText({super.key, this.optionText});

  String? optionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
      ),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        optionText.toString(),
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
