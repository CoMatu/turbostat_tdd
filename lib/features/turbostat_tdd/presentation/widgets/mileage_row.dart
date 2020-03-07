import 'package:flutter/material.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class MileageRowWidget extends StatelessWidget {
  
  const MileageRowWidget({
    Key key,
    @required TextEditingController textFieldController,
  })  : _textFieldController = textFieldController,
        super(key: key);

  final TextEditingController _textFieldController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'mileage data',
          style: Theme.of(context).textTheme.overline,
        ),
        GestureDetector(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: TextField(
                      controller: _textFieldController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText:
                              S.of(context).car_card_enter_current_mileage),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          S.of(context).button_cancel,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          S.of(context).button_save,
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.edit,
              size: 18.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
