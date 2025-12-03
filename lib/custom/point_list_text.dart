import 'package:flutter/material.dart';
import 'package:fluttertutorial/responsive/responsive.dart';
import 'package:fluttertutorial/responsive/sizedConfig.dart';

class PointListText extends StatelessWidget {
  PointListText({super.key,this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        "\u2022 ${text.toString()}",
        style: TextStyle(
          fontSize: Responsive.isMobile(context) ? Sizeconfig.ScreenWidth * 0.04 : Sizeconfig.ScreenWidth * 0.055,
          color: Colors.black,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.6,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}