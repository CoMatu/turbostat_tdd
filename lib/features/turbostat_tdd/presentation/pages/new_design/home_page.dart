import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;
  int carListLenght;
  @override
  void initState() {
    controller = PageController();
    carListLenght = 3; // TODO add getter
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                // TODO implementation
              },
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: CarCardWidget(
                    index: position,
                    itemCount: carListLenght,
                    onButtonPressedForward: onButtonPressedForward,
                    onButtonPressedBack: onButtonPressedBack,
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

  void onButtonPressedForward() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void onButtonPressedBack() {
    controller.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }
}
