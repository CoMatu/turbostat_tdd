import 'package:flutter/material.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class CustomChancelButton extends StatelessWidget {
  const CustomChancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFFFF000).withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: Color(0xFFEB5757))),
      child: Text(
        S.of(context).button_cancel,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
