import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_stats_data.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/donut_pie_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  DateTime startDate;
  DateTime endDate;
  String carId;
  var data;
  Series dataSeries;
  NumberFormat _numberFormat;

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    _numberFormat = NumberFormat.simpleCurrency(locale: myLocale.languageCode);

    super.didChangeDependencies();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Статистика расходов',
              style: Theme.of(context).textTheme.headline5,
            ),
            Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () async {
                      DateTime _date = DateTime.now();
                      startDate = DateTime(_date.year, _date.month, 1);
                      setState(() {});
                    },
                    child: Text('В этом месяце'), //TODO add i18n
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      DateTime _date = DateTime.now();
                      if (_date.month == 1) {
                        startDate = DateTime((_date.year - 1), 12, 1);
                        endDate = DateTime((_date.year - 1), 12, 31);
                      } else {
                        DateTime _finalDayDate =
                            DateTime(_date.year, _date.month, 0);
                        startDate = DateTime(_date.year, (_date.month - 1), 1);
                        endDate = DateTime(
                            _date.year, (_date.month - 1), _finalDayDate.day);
                      }
                      setState(() {});
                    },
                    child: Text('В прошлом месяце'), //TODO add i18n
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      DateTime _date = DateTime.now();
                      startDate = DateTime(_date.year, 1, 1);
                      setState(() {});
                    },
                    child: Text('С начала года'), //TODO add i18n
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Expanded(child: Consumer<CurrentCar>(
                builder: (context, car, child) {
                  return car.currentCar != null
                      ? FutureBuilder(
                          future: _getStartData(carId, startDate, endDate),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        _numberFormat.format(
                                            snapshot.data.data[0].amount +
                                                snapshot.data.data[1].amount),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    DonutPieChart([snapshot.data])
                                  ],
                                );
                              }
                            }
                            return Text('data not aviable');
                          })
                      : Container();
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  _getStartData(String carId, DateTime startDate, DateTime endDate) async {
    final carId =
        Provider.of<CurrentCar>(context, listen: false).currentCar.carId;
    if (startDate != null) {
      final chartData =
          await GetStatsData().getData(carId, startDate, startDate);
      return chartData;
    } else {
      final endDate = DateTime.now();
      final startDate = DateTime(endDate.year, endDate.month, 1);

      final chartData =
          await GetStatsData().getData(carId, startDate, startDate);
      return chartData;
    }
  }
}
