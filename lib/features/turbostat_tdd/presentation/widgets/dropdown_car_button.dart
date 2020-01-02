import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';

class DropdownCarButton extends StatefulWidget {
  const DropdownCarButton({
    Key key,
  }) : super(key: key);

  @override
  _DropdownCarButtonState createState() => _DropdownCarButtonState();
}

class _DropdownCarButtonState extends State<DropdownCarButton> {
  String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        Provider.of<PageCounter>(context, listen: false).updateIndex(2); // переход на другую страницу
      },
      child: Row(
        children: <Widget>[
          Consumer<CurrentCar>(
            builder: (context, car, child) {
              return car.currentCar != null? Text(car.currentCar.carMark) : Container();
            },
          ),
          SizedBox(
            width: 12,
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
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
