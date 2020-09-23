import 'dart:ui';

import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final int index;
  final int itemCount;
  final VoidCallback onButtonPressedForward;
  final VoidCallback onButtonPressedBack;

  const CarCardWidget({
    @required this.index,
    @required this.itemCount,
    @required this.onButtonPressedForward,
    @required this.onButtonPressedBack,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inactiveColor = Color(0xFF27AE60);
    const activeColor = Color(0xFF219653);
    return Card(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onButtonPressedBack,
            child: Icon(
              Icons.arrow_back_ios,
              color: index == 0 ? inactiveColor.withOpacity(0.3) : activeColor,
            ),
          ),
          Expanded(
            child: Text('PAGE $index'),
          ),
          GestureDetector(
            onTap: onButtonPressedForward,
            child: Icon(
              Icons.arrow_forward_ios,
              color: index == (itemCount - 1)
                  ? inactiveColor.withOpacity(0.3)
                  : activeColor,
            ),
          )
        ],
      ),
    );
  }
}
