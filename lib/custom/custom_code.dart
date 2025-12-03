import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCode extends StatelessWidget {
  CustomCode({super.key, this.code});

  String? code;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HighlightView(
        code.toString(),
        tabSize: 2,
        language: 'dart',
        theme: githubTheme,
        padding: const EdgeInsets.all(12),
        textStyle: GoogleFonts.sourceCodePro(
          textStyle: const TextStyle(
          fontSize: 14,
        ),
        ),
      ),
    );
  }
}
