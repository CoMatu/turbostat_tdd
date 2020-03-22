import 'package:charts_flutter/flutter.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/pie_cart_data_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_entry_parts.dart'
    as gep;
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

    _filteredEntries.forEach((element) async {
      final _parts = await sl<gep.GetEntryParts>()
          .call(gep.Params(entryId: element.entryId));
      final List<PartModel> _preFiltered =
          _parts.fold((failure) => [], (_parts) => _parts);
//      _filteredParts.addAll(_preFiltered); //TODO проверить, нужно ли обнулять список при каждом обращении
      _preFiltered.forEach((element) {
        _filteredParts.add(element);
      });
    });

    // из них достаем сумму затрат на запчасти
    _filteredParts.forEach((element) {
      valueOfParts = valueOfParts + element.partPrice;
    });

    final data = [
      PieChartDataModel('valueOfWork', valueOfWork),
      PieChartDataModel('valueOfParts', valueOfParts),
    ];

    return Series<PieChartDataModel, double>(
      id: 'Costs',
      domainFn: (PieChartDataModel amount, _) => amount.amount,
      measureFn: (PieChartDataModel sales, _) => sales.amount,
      data: data,
      labelAccessorFn: (PieChartDataModel model, index) =>
          model.amount.toString(),
    );
  }
}
