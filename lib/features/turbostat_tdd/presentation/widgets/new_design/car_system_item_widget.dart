import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarSystemItem extends StatelessWidget {
  final String title;
  const CarSystemItem({@required this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        height: MediaQuery.of(context).size.width * 0.44 * 0.33,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 36.0,
                width: 36.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0E202E),
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.check,
                    color: Color(0xFF10AA78),
                    size: 14.0,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(title, style: TextStyle(color: Colors.white)),
            )),
          ],
        ),
      ),
    );
  }
}
