import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

class CarCardWidget extends StatelessWidget {
  final CarModel carModel;
  final int index;
  final int itemCount;
  final VoidCallback onButtonPressedForward;
  final VoidCallback onButtonPressedBack;

  const CarCardWidget({
    @required this.carModel,
    @required this.index,
    @required this.itemCount,
    @required this.onButtonPressedForward,
    @required this.onButtonPressedBack,
    Key key,
  })  : assert(carModel != null),
        super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        '${carModel.carMark} ${carModel.carModel}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          FontAwesomeIcons.edit,
                          color: Colors.grey,
                          size: 14.0,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      carModel.carVin.isEmpty
                          ? Text('VIN: -----')
                          : Text('VIN: ${carModel.carVin}'),
                      Text('Год выпуска: ${carModel.carYear}')
                    ],
                  ),
                ],
              ),
            ),
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
