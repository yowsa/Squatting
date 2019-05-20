import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:squat_mobility/design_elements.dart';

class SquatsCircularChartWidget extends StatefulWidget {
  @override
  SquatsCircularChartState createState() => SquatsCircularChartState();
  SquatsCircularChartWidget({Key key}) : super(key: key);
}

class SquatsCircularChartState extends State<SquatsCircularChartWidget> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final _chartSize = Size(350.0, 350.0);
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
    Color dialColor = mainColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(<CircularSegmentEntry>[
        CircularSegmentEntry(
          value,
          dialColor,
          rankKey: 'percentage',
        ),
      ], rankKey: 'percentage'
      ),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            height: 300.0,
            width: screenWidth,
            child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0.0, 0.0),
                child: ClipOval(
                  child: Container(
                    color: Colors.white,
                    height: 255.0,
                    width: 255.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.0),
                child: AnimatedCircularChart(

                  key: _chartKey,
                  size: _chartSize,
                  initialChartData: _generateChartData(value),
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                  holeLabel: '$valueMin' + ' min',
                  labelStyle: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 34.0,
                  ),
                ),
              ),
            ],
    ),
          ),
        ),
        
        Container(
          child: Text(
            '$valueMinLeft out of $goal minutes left',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
