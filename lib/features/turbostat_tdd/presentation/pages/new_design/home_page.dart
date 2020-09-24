import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/load_mileage_bloc/cubit/mileage_cubit.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/custom_circle_progress_bar.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/new_design/car_card_widget.dart';
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

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBlocProviderCarsCards(),
          SpeedometerPainter(
            progress: _progress,
          ),
          buildTitleSeparator('Состояние систем'),
          Placeholder(),
          buildTitleSeparator('Календарь обслуживания'),
          Placeholder(),
        ],
      ),
    );
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
        BlocProvider(
          create: (context) => MileageCubit(sl<TurbostatRepository>()),
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
/*             child: Center(
              child: CustomCircleProgressBar(),
            ), */
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
