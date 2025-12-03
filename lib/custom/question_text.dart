import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionText extends StatelessWidget {
  QuestionText({super.key, this.questionText});

  String? questionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: Colors.grey.withOpacity(0.5),
        //   width: 1,
        // ),
      ),
      child: Text(
        questionText.toString(),
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 16,
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
