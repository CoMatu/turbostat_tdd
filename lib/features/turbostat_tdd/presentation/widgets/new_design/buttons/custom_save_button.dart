import 'package:flutter/material.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class CustomSaveButton extends StatelessWidget {
  final VoidCallback onSaveButtonPressed;
  const CustomSaveButton({
    @required this.onSaveButtonPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFF6FCF97).withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: Color(0xFF6FCF97))),
      child: Text(
        S.of(context).button_save,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onSaveButtonPressed,
    );
  }
}
