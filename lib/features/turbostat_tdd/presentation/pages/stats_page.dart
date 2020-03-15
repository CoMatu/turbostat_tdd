import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/donut_pie_chart.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key key}) : super(key: key);

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
                    onPressed: () {},
                    child: Text('В этом месяце'),
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
                    child: Text('В прошлом месяце'),
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
                    child: Text('С начала года'),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Expanded(
                child: DonutPieChart.withSampleData(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
