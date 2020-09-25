import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/current_car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/custom_circle_progress_bar.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_card_widget.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_system_item_widget.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/speedometer_painter.dart';
import 'package:turbostat_tdd/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController controller;
  int carListLenght;
// тестовые значения уровня состояния систем авто
  double _progress = 0.8;
  CurrentCar currentCarProvider;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    currentCarProvider = Provider.of<CurrentCar>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBlocProviderCarsCards(),
          SpeedometerPainter(
            currentCar: currentCarProvider.currentCar,
            progress: _progress,
          ),
          buildTitleSeparator('Состояние систем'),
          systemsReviewPanel(),
          buildTitleSeparator('Календарь обслуживания'),
          Placeholder(),
        ],
      ),
    );
  }

  Widget systemsReviewPanel() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Column(
            children: [
              CarSystemItem(title: 'Двигатель'),
              CarSystemItem(title: 'Тормозная система'),
              CarSystemItem(title: 'Рулевой механизм'),
              CarSystemItem(title: 'Кузов и салон'),
            ],
          ),
          Column(
            children: [
              CarSystemItem(title: 'Ходовая часть'),
              CarSystemItem(title: 'Трансмиссия'),
              CarSystemItem(title: 'Электрооборудование'),
              CarSystemItem(title: 'Дополнительное оборудование'),
            ],
          ),
        ],
      ),
    ));
  }

  Padding buildTitleSeparator(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 24,
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Widget buildBlocProviderCarsCards() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LoadDataBloc>()..add(GetAllCar()),
        ),
      ],
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is Loading) {
            return Container(height: 70.0, child: CustomCircleProgressBar());
          } else if (state is LoadedAllCars) {
            return Container(
              height: 100,
              child: buildPageView(state),
            );
          }
          return Container(
            height: 100,
          );
        },
      ),
    );
  }

  PageView buildPageView(LoadedAllCars state) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (index) {
        // TODO implementation
      },
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CarCardWidget(
            carModel: state.listAll[position],
            index: position,
            itemCount: state.listAll.length,
            onButtonPressedForward: onButtonPressedForward,
            onButtonPressedBack: onButtonPressedBack,
          ),
        );
      },
      itemCount: state.listAll.length,
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
