import 'package:flutter/material.dart';
import 'package:fluttertutorial/responsive/responsive.dart';
import 'package:fluttertutorial/responsive/sizedConfig.dart';

class NumberListText extends StatelessWidget {
  NumberListText({super.key,this.text,this.index});
  String? text;
  String? index;
  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        "$index $text",
        style: TextStyle(
          fontSize: Responsive.isMobile(context) ? Sizeconfig.ScreenWidth * 0.04 : Sizeconfig.ScreenWidth * 0.045,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}