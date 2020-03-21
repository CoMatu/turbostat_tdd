import 'package:charts_flutter/flutter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/pie_cart_data_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_part_models.dart'
    as gP;
import 'package:turbostat_tdd/injection_container.dart';

class GetStatsData {
  Future<Series<PieChartDataModel, double>> getData(
      String carId, DateTime startPeriod, DateTime endPeriod) async {
    List<EntryModel> _filteredEntries = [];
    List<PartModel> _filteredParts = [];
    double valueOfWork = 0.0;
    double valueOfParts = 0.0;
    final res = await sl<GetAllEntries>().call(Params(carId: carId));
    List<EntryModel> _entriesList = res.fold(
      (failure) => [],
      (res) => res,
    );
    // вытащили все записи в указанном периоде времени
    _entriesList.forEach((element) {
      if (element.entryDateTime.millisecondsSinceEpoch >=
              startPeriod.millisecondsSinceEpoch &&
          element.entryDateTime.millisecondsSinceEpoch <=
              endPeriod.millisecondsSinceEpoch) {
        _filteredEntries.add(element);
      }
    });
    // из них достаем сумму затрат на выполненные работы
    _filteredEntries.forEach((element) {
      valueOfWork = valueOfWork + element.entryWorkPrice;
    });

    // достаем списки запчастей по каждой записи
    final _parts =
        await sl<gP.GetAllPartModels>().call(gP.Params(carId: carId));
    _filteredParts = _parts.fold(
      (failure) => [],
      (_parts) => _parts,
    );

    // из них достаем сумму затрат на запчасти
    _filteredParts.forEach((element) {
      valueOfParts = valueOfParts + element.partPrice;
    });

    final data = [
      PieChartDataModel('valueOfWork', valueOfWork),
      PieChartDataModel('valueOfParts', valueOfParts),
    ];

    return Series<PieChartDataModel, double>(
      id: 'Sales',
      domainFn: (PieChartDataModel amount, _) => amount.amount,
      measureFn: (PieChartDataModel sales, _) => sales.amount,
      data: data,
      labelAccessorFn: (PieChartDataModel model, index) => model.amount.toString(),
    );
  }
}
