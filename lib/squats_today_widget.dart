import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
/*
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
  void squatsTodaySetState() {
    setState(() {
      List<CircularStackEntry> newData = sumSquats(today).toDouble();
      _chartKey.currentState.updateData(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(
          child: AnimatedCircularChart(
            key: _chartKey,
            size: _chartSize,
            initialChartData: <CircularStackEntry>[
              CircularStackEntry(
                <CircularSegmentEntry>[
                  CircularSegmentEntry(
                    sumSquats(today).toDouble(),
                    Colors.blue[400],
                    rankKey: 'completed',
                  ),
                  CircularSegmentEntry(
                    goal - sumSquats(today).toDouble(),
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
            ),
          ),
        ),
        FloatingActionButton(onPressed: () {
          squatsTodaySetState();
        })
      ],
    );
  }
}
*/

// New circular chart version

class SquatsCircularChartWidget extends StatefulWidget {
  @override
  SquatsCircularChartState createState() => SquatsCircularChartState();
  SquatsCircularChartWidget({Key key}) : super(key: key);
}

class SquatsCircularChartState extends State<SquatsCircularChartWidget> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final _chartSize = Size(300.0, 300.0);
  String today; // = DateTime.now().toString().substring(0, 10);
  var goal = 30;
  var value; // = sumSquats(today).toDouble();
  var valueMin; // Minute value of todays squats
  var valueMinLeft; // Minutes left to squat today
  // var value2 = SquatsCircularChartState();

  SquatsCircularChartState() {
    today = DateTime.now().toString().substring(0, 10);
    value = (sumSquats(today).toDouble()) * 3.3333333;
    valueMin = sumSquats(today);
    valueMinLeft = goal - valueMin;
    // todayValue();
    //print(todayValue());
  }
/*
  todayValue() {
    String today = DateTime.now().toString().substring(0, 10);
    var todayValue = sumSquats(today);
    return todayValue;
  }
*/
  void squatsCircularChartSetState() {
    setState(() {
      value = (sumSquats(today).toDouble()) * 3.3333333;
      valueMin = sumSquats(today);
      valueMinLeft = goal - valueMin;
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.blue;
    // labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(<CircularSegmentEntry>[
        CircularSegmentEntry(
          value,
          dialColor,
          rankKey: 'percentage',
        )
      ], rankKey: 'percentage'),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          child: AnimatedCircularChart(
            key: _chartKey,
            size: _chartSize,
            initialChartData: _generateChartData(value),
            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValues: true,
            holeLabel: '$valueMin' +' min',
            labelStyle: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Container(
          child: Text('$valueMinLeft out of $goal minutes left'),
        )
      ],
    );
  }
}
