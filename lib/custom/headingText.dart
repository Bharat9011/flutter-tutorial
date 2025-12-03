import 'package:flutter/material.dart';
import 'package:fluttertutorial/responsive/responsive.dart';
import 'package:fluttertutorial/responsive/sizedConfig.dart';
import 'package:google_fonts/google_fonts.dart';

class Headingtext extends StatelessWidget {
  Headingtext({super.key, this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text.toString(),
        style: GoogleFonts.notoSansGeorgian(
          textStyle: TextStyle(
            fontSize:
                Responsive.isMobile(context)
                    ? Sizeconfig.ScreenWidth * 0.07
                    : Sizeconfig.ScreenWidth * 0.05,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
