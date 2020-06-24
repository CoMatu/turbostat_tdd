import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/mileage_usecases/get_car_mileage.dart';
import 'package:turbostat_tdd/injection_container.dart';
// ! don't use

class MileageProvider extends ChangeNotifier {
  MileageModel _mileageModel;

  MileageModel get mileages => _mileageModel;

  Future<void> getLastMileage(String carId) async {
    final _res = await sl<GetCarMileage>().call(Params(carId: carId));
    _mileageModel = _res.fold(
      (failure) => null,
      (_res) => _res,
    );

    notifyListeners();
  }
}
