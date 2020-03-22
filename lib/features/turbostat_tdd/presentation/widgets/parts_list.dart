import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class PartsListWidget extends StatefulWidget {
  const PartsListWidget({
    Key key,
  }) : super(key: key);

  @override
  _PartsListWidgetState createState() => _PartsListWidgetState();
}

class _PartsListWidgetState extends State<PartsListWidget> {
  String _carId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialData(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<Parts>(
            builder: (context, part, child) => ListView.builder(
              itemCount: part.parts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.adjust),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(part.parts[index].partName)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, top: 6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Артикул: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                      Text(
                                        part.parts[index].partCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Стоимость: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                      Text(
                                        part.parts[index].partPrice.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {},
              ),
              */
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () async {
                          final ConfirmAction confirmAction =
                              await asyncConfirmDialog(context);
                          if (confirmAction == ConfirmAction.ACCEPT) {
                            Provider.of<Parts>(context, listen: false)
                                .delete(_carId, part.parts[index]);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  initialData(BuildContext context) async {
    _carId = Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

    Provider.of<Parts>(context, listen: false).update(_carId);
  }
}

Future<ConfirmAction> asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).delete_entry_operation),
        content: Text(S.of(context).delete_entry_operation_warning),
        actions: <Widget>[
          FlatButton(
            child: Text(
              S.of(context).button_cancel,
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: Text(
              S.of(context).button_delete,
            ),
            onPressed: () async {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

/*

          ListView.builder(
            itemCount: _parts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(Icons.adjust),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(_parts[index].partName),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                _parts[index].partCode,
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                _parts[index].partPrice.toString(),
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /*
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {},
              ),
              */
                    IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () async {
                        final ConfirmAction confirmAction =
                            await asyncConfirmDialog(context);
                        if (confirmAction == ConfirmAction.ACCEPT) {
                          Provider.of<Parts>(context, listen: false)
                              .delete(_carId, _parts[index]);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
*/
