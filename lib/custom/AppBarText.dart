import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarText extends StatelessWidget {
  AppBarText({
    super.key,
    required this.text,
  });

  String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}