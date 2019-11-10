import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/core/util/page_counter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/injection_container.dart';

class DropdownCarButton extends StatefulWidget {
  const DropdownCarButton({
    Key key,
  }) : super(key: key);

  @override
  _DropdownCarButtonState createState() => _DropdownCarButtonState();
}

class _DropdownCarButtonState extends State<DropdownCarButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageCounter>(
      builder: (context, page, child) {
        return FlatButton(
          onPressed: () {

          },
          child: Text(''), // TODO решить как брать стейт по текущей машине
        );
      },
    );
  }

/*  dropDownItems(List<CarModel> listAll) =>
      listAll.map<DropdownMenuItem<Text>>((v) {
        var text = v.carMark + ' ' + v.carModel + ' ' + v.carYear.toString();
        return DropdownMenuItem<Text>(
          child: Text(text),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<LoadDataBloc>()..add(GetAllCar()),
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is LoadedAllCars) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: DropdownButton(
                items: dropDownItems(state.listAll),
                onChanged: (newValue) {},
              ),
            );
          }
          return Container();
        },
      ),
    );
  }*/
}
