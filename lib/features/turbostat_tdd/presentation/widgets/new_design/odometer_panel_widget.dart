import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/load_mileage_bloc/load_mileage_bloc.dart';
import 'package:turbostat_tdd/injection_container.dart';

class OdometerPanelWidget extends StatelessWidget {
  const OdometerPanelWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 32,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Color(0xFFF2994A).withOpacity(0.3),
                ),
              ),
              child: Container(
                height: 20,
                width: 20,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.flagCheckered,
                    size: 11,
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF2994A),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => sl<LoadMileageBloc>(),
              child: BlocBuilder<LoadMileageBloc, LoadMileageState>(
                builder: (context, state) {
                  if (state is LoadedCarMileage) {
                    return Text(
                      state.mileage.mileage.toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  }
                  return Text('.....');
                },
              ),
            ),
            Icon(
              FontAwesomeIcons.edit,
              color: Color(0xFFF2994A).withOpacity(0.5),
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
