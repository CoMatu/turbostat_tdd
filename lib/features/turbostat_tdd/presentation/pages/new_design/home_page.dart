import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: CarCardWidget(
                    index: position,
                    itemCount: 3,
                  ),
                );
              },
              itemCount: 3,
            ),
          ),
          Placeholder(
            fallbackHeight: 200,
          ),
          Placeholder(),
        ],
      ),
    );
  }
}
