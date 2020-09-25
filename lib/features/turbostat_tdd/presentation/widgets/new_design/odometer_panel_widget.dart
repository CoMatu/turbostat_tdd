import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/mileage_usecases/add_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/load_mileage_bloc/cubit/mileage_cubit.dart';
import 'package:turbostat_tdd/generated/i18n.dart';
import 'package:turbostat_tdd/injection_container.dart';

class OdometerPanelWidget extends StatelessWidget {
  final String carId;

  const OdometerPanelWidget({@required this.carId, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 32,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
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
            ),
            BlocProvider(
              create: (context) => MileageCubit(sl<TurbostatRepository>()),
              child: BlocBuilder<MileageCubit, MileageState>(
                builder: (context, state) {
                  final mileageCubit = context.bloc<MileageCubit>();
                  mileageCubit.getCarMileage(carId);
                  if (state is MileageInitial) {
                    return Text('.....');
                  } else if (state is MileageLoading) {
                    return Text('.....');
                  } else if (state is MileageLoaded) {
                    return Text(
                      '${state.mileageModel.mileage.toString()} km',
                      style: TextStyle(color: Colors.white),
                    );
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () => showMileageDialog(context),
              child: Icon(
                FontAwesomeIcons.edit,
                color: Color(0xFFF2994A).withOpacity(0.5),
                size: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMileageDialog(BuildContext context) async {
    final _textFieldController = TextEditingController();
    final width = MediaQuery.of(context).size.width * 0.6;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            contentPadding: const EdgeInsets.all(10),
            content: Container(
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _textFieldController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: S.of(context).car_card_enter_current_mileage),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CustomChancelButton()),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: CustomSaveButton(
                          onSaveButtonPressed: () =>
                              addMileage(context, _textFieldController.text),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> addMileage(BuildContext context, String mileage) async {
    final _entry = MileageModel(
      mileageDateTime: DateTime.now(),
      mileage: int.parse(mileage),
    );
    await sl<AddCarMileage>().addCarMileage(carId, _entry);
    Navigator.of(context).pop();
  }
}

class CustomChancelButton extends StatelessWidget {
  const CustomChancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFFFF000).withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: Color(0xFFEB5757))),
      child: Text(
        S.of(context).button_cancel,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class CustomSaveButton extends StatelessWidget {
  final VoidCallback onSaveButtonPressed;
  const CustomSaveButton({
    @required this.onSaveButtonPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFF6FCF97).withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: Color(0xFF6FCF97))),
      child: Text(
        S.of(context).button_save,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onSaveButtonPressed,
    );
  }
}
