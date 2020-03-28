import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_stats_data.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/donut_pie_chart.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

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
  var thisMonthColor = Colors.white;
  var lastMonthColor = Colors.white;
  var thisYearColor = Colors.white;
  var totalColor = Colors.white;

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
              S.of(context).expense_statistics,
              style: Theme.of(context).textTheme.headline5,
            ),
            Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: thisMonthColor,
                    onPressed: () async {
                      DateTime _date = DateTime.now();
                      startDate = DateTime(_date.year, _date.month, 1);
                      endDate = _date;
                      setState(() {
                        thisYearColor = Colors.white;
                        thisMonthColor = Colors.blue;
                        lastMonthColor = Colors.white;
                        totalColor = Colors.white;
                      });
                    },
                    child: Text(S.of(context).this_month),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: lastMonthColor,
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
                      setState(() {
                        thisYearColor = Colors.white;
                        thisMonthColor = Colors.white;
                        lastMonthColor = Colors.blue;
                        totalColor = Colors.white;
                      });
                    },
                    child: Text(S.of(context).last_month),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: thisYearColor,
                    onPressed: () {
                      DateTime _date = DateTime.now();
                      startDate = DateTime(_date.year, 1, 1);
                      endDate = _date;
                      setState(() {
                        thisYearColor = Colors.blue;
                        thisMonthColor = Colors.white;
                        lastMonthColor = Colors.white;
                        totalColor = Colors.white;
                      });
                    },
                    child: Text(S.of(context).year_to_date),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                  child: RaisedButton(
                    color: totalColor,
                    onPressed: () {
                      DateTime _date = DateTime.now();
                      startDate = DateTime(1970, 1, 1);
                      endDate = _date;
                      setState(() {
                        thisYearColor = Colors.white;
                        thisMonthColor = Colors.white;
                        lastMonthColor = Colors.white;
                        totalColor = Colors.blue;
                      });
                    },
                    child: Text(S.of(context).total_cost),
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
                                            .headline6,
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
            Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(S.of(context).work_value),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue[200]),
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(S.of(context).parts_value),
                    ],
                  ),
                ),
              ],
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
      final chartData = await GetStatsData().getData(carId, startDate, endDate);
      return chartData;
    } else {
      final endDate = DateTime.now();
      final startDate = DateTime(endDate.year, endDate.month, 1);

      final chartData = await GetStatsData().getData(carId, startDate, endDate);
      return chartData;
    }
  }
}
