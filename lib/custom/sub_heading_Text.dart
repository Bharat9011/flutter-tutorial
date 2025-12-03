import 'package:flutter/material.dart';
import 'package:fluttertutorial/responsive/responsive.dart';
import 'package:fluttertutorial/responsive/sizedConfig.dart';

class SubHeadingText extends StatelessWidget {
  SubHeadingText({super.key,this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text.toString(),
        style: TextStyle(
          fontSize: Responsive.isMobile(context) ? Sizeconfig.ScreenWidth * 0.05 : Sizeconfig.ScreenWidth * 0.04,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}