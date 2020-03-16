import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
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
                    onPressed: () {},
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
                    onPressed: () {},
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
                          future: _getStartData(carId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                return DonutPieChart([snapshot.data]);
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

  _getStartData(String carId) async {
    final endPeriod = DateTime.now();
    final startPeriod = DateTime(endPeriod.year, endPeriod.month, 1);
    final carId =
        Provider.of<CurrentCar>(context, listen: false).currentCar.carId;
    final chartData =
        await GetStatsData().getData(carId, startPeriod, endPeriod);
    return chartData;
  }
}
