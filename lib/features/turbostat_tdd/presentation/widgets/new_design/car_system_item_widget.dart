import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarSystemItem extends StatelessWidget {
  final String title;
  const CarSystemItem({@required this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height2 = MediaQuery.of(context).size.width * 0.44 * 0.33;
    var width2 = MediaQuery.of(context).size.width * 0.44;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Container(
        width: width2,
        height: height2,
        child: Row(
          children: [
            buildStatusIcon(),
            buildTitle(),
          ],
        ),
      ),
    );
  }

  Expanded buildTitle() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.fade,
      ),
    ));
  }

  Widget buildStatusIcon() {
    var color2 = Color(0xFF0E202E);
    var iconColor = Color(0xFF10AA78);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 36.0,
        width: 36.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color2,
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.check,
            color: iconColor,
            size: 14.0,
          ),
        ),
      ),
    );
  }
}
