import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Consumer<Parts>(
      builder: (context, partsList, child) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
          ),
          child: Column(
            children: <Widget>[
              Text(S.of(context).database_parts),
              ListView.builder(
                shrinkWrap: true,
                itemCount: partsList.parts.length,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: <Widget>[
                    Expanded(child: Text(partsList.parts[index].partName)),
                    Text(partsList.parts[index].partPrice.toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Provider.of<PartsCart>(context, listen: false)
                            .add(partsList.parts[index]);

                        final carId =
                            Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

                        Provider.of<Parts>(context, listen: false)
                            .delete(carId, partsList.parts[index]);

                        setState(() {
                          totalPrice =
                              Provider.of<PartsCart>(context, listen: false)
                                  .totalPrice;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
