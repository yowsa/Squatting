import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'history_screen.dart';
import 'track_time_screen.dart';
import 'squats_today_widget.dart';
import 'routes_widget.dart';
import 'design_elements.dart';

final chartKey = GlobalKey<SquatsCircularChartState>();

/*
var newUser2 = true;

void main() async {
  final prefs = await SharedPreferences.getInstance();

  final newUser = prefs.getBool('newUser') ?? true;
  prefs.remove('newUser');

  newUser
      ? runApp(MaterialApp(title: 'Navigation Basics', home: WelcomeScreen()))
      : runApp(MaterialApp(title: 'Navigation Basics', home: MainScreen()));

  loadSquats();
}
*/
class MainScreen extends StatelessWidget {
  final String today = DateTime.now().toString().substring(0, 10);
  //final Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    var circularChart = SquatsCircularChartWidget(key: chartKey);
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: circularChart,
          ),
          Row(
            children: <Widget>[
              FloatingActionButton(
                heroTag: 0,
                backgroundColor: Colors.grey,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()));
                },
                child: Icon(Icons.assessment),
              ),
              FloatingActionButton(
                heroTag: 1,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InfoScreen()));
                },
                child: Icon(Icons.info),
              ),
            ],
          ),
          Expanded(
            child: ModalSheet(),
          ),
          Center(
            //child: ClipRect(
             //clipper: MyClipper(),
              child: Container(
                height: 200.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only (topLeft: Radius.elliptical(200.0, 70.0), topRight: Radius.elliptical(200.0,70.0)),
                  color: Colors.deepOrangeAccent[400],
                ),
              ),
           // ),
          ),
        ],
      ),
    );
  }
}
