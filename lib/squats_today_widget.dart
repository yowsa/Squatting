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

  chartText() {
    if (valueMinLeft > 0) {
      return '$valueMinLeft out of $goal minutes left';
    } else {
      return 'You have reached your goal for today';

    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double chartBox = 300.0;
    var backgroundLogo = AssetImage('assets/light-logo.png');
    var image = Image(
      image: backgroundLogo,
      width: 200.0,
      height: 200.0,
    );
    return Column(
      children: <Widget>[
        //Padding(
          //padding: EdgeInsets.only(top: screenHeight/5),
        //  child:
          Container(
            height: chartBox,
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
                    child: image,
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
        //),
        
        Container(
          height: screenHeight*0.06,
          alignment: Alignment.center,
          child: Text(
            chartText(),
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
