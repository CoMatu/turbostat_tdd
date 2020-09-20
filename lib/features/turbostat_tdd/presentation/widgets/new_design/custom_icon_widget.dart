import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconWidget extends StatelessWidget {
  final IconData fontAwesomeIcons;
  final Color centerColor, iconColor, borderColor;
  final double iconSize;
  const CustomIconWidget(
      {Key key,
      @required this.fontAwesomeIcons,
      @required this.borderColor,
      @required this.centerColor,
      @required this.iconColor,
      @required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF0E202E),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 30,
            width: 30,
            child: Center(
              child: FaIcon(
                fontAwesomeIcons,
                color: iconColor,
                size: iconSize,
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: centerColor.withOpacity(0.4)),
          ),
        ));
  }
}
