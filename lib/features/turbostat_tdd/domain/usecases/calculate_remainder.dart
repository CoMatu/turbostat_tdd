import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/mileage_usecases/get_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/entry_usecases/get_entries.dart'
    as gE;
import 'package:turbostat_tdd/injection_container.dart';

class CalculateRemainder {
  int _remainderDays;
  int _remainderDistance;

  Future<int> getRemainderDays(
      String carId, MaintenanceModel maintenance) async {
    final _date = DateTime.now();
    final _limitInDays = (maintenance.maintenanceMonthLimit * 29.3)
        .round(); // average days per month

    List<EntryModel> _listE = await getLastEntry(carId, maintenance);

    final DateTime _lastEntryDate = _listE.last.entryDateTime;

    final _nextMaintenanceDate =
        _lastEntryDate.add(Duration(days: _limitInDays));

    _remainderDays = _nextMaintenanceDate.difference(_date).inDays;

    return _remainderDays;
  }

  Future<int> getRemainderDistance(
      String carId, MaintenanceModel maintenance) async {
    final _resMileage = await sl<GetCarMileage>().call(Params(carId: carId));
    final MileageModel _mileage = _resMileage.fold(
      (failure) => MileageModel(mileageDateTime: DateTime.now(), mileage: 0),
      (_resMileage) => _resMileage,
    );

    List<EntryModel> _listE = await getLastEntry(carId, maintenance);

    final int _lastEntryMileage = _listE.last.entryMileage;

    final int _nextMaintMileage =
        _lastEntryMileage + maintenance.maintenanceMileageLimit;

    _remainderDistance = _nextMaintMileage - _mileage.mileage;

    return _remainderDistance;
  }

  Future<List<EntryModel>> getLastEntry(
      String carId, MaintenanceModel maintenance) async {
    final _entries = await sl<gE.GetEntries>().call(gE.Params(
      carId: carId,
      maintenanceId: maintenance.maintenanceId,
    ));

    final _listE = _entries.fold(
      (failure) => null,
      (_listE) => _listE,
    );

    _listE.sort((a, b) => b.entryDateTime.millisecondsSinceEpoch
        .compareTo(a.entryDateTime.millisecondsSinceEpoch));
    return _listE;
  }
}
