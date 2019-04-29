import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';


class SquatsTodayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SquatsTodayState squatsToday = SquatsTodayState();

    return squatsToday;
  }
}

class SquatsTodayState extends State<SquatsTodayWidget> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final _chartSize = Size(300.0, 300.0);
  final String today = DateTime.now().toString().substring(0, 10);
  var goal = 30.00;

  var todaysSquats = allSquats['squats']['2019-04-24'];

  void loadState() {
    setState(() {
      todaysSquats = (allSquats['squats']['2019-04-24'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(todaysSquats.toString()),
        ),
        Expanded(
          child: AnimatedCircularChart(
              key: _chartKey, size: _chartSize, initialChartData: <CircularStackEntry>[
            CircularStackEntry(
              <CircularSegmentEntry>[
                CircularSegmentEntry(
                  sumSquats(today).toDouble(),
                  Colors.blue[400],
                  rankKey: 'completed',
                ),
                CircularSegmentEntry(
                  goal-sumSquats(today).toDouble(),
                 Colors.white,
                  rankKey: 'remaining',
                ),
              ],
              rankKey: 'progress',
            ),
          ],
          chartType: CircularChartType.Radial,
          percentageValues: false,
          holeLabel: sumSquats(today).toString() + ' min',
          labelStyle: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),),
        )
      ],
    );
  }
}
