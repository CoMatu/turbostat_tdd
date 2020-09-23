import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/custom_circle_progress_bar.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_card_widget.dart';
import 'package:turbostat_tdd/injection_container.dart';

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
          BlocProvider(
            create: (context) => sl<LoadDataBloc>()..add(GetAllCar()),
            child: BlocBuilder<LoadDataBloc, LoadDataState>(
              builder: (context, state) {
                if (state is Loading) {
                  return Container(
                      height: 70.0, child: CustomCircleProgressBar());
                } else if (state is LoadedAllCars) {
                  return Container(
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
                    ),
                  );
                }
                return Container();
              },
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
