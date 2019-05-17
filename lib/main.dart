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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var circularChart = SquatsCircularChartWidget(key: chartKey);
    return Scaffold(
      backgroundColor: backgroundColor,
     /* appBar: AppBar(
        backgroundColor: menuColor,
        title: Text('SQUATTING'),
      ),*/
      body: Column(
        children: <Widget>[
          FractionallySizedBox(
            child: circularChart,
          ),
          Expanded(
            child: ModalSheet(),
          ),
          Stack(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 275.0,
                width: screenWidth,
              ),
             Positioned(
               bottom: 0.0,
               left: 0.0,
               child: Container(
                      height: 250.0,
                      width: screenWidth,
                 decoration: BoxDecoration(
                   color: Colors.orangeAccent,
                   borderRadius: BorderRadius.only (topLeft: Radius.elliptical((screenWidth/2), (screenWidth/4)), topRight: Radius.elliptical((screenWidth/2),(screenWidth/4))),
                 ),

                    ),
             ),
              Align(
                alignment: Alignment(-0.5, 0.0),
                child: FloatingActionButton(
                  heroTag: 2,
                  backgroundColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HistoryScreen()));
                  },
                  child: Icon(Icons.assessment),
                ),
              ),
              Align(
                alignment: Alignment(0.5, 0),
                child: Container(
                  //alignment: Alignment(-1, 0),
                  child: FloatingActionButton(
                    heroTag: 3,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfoScreen()));
                    },
                    child: Icon(Icons.info),
                  ),
                ),
              )
            ],

          ),
        ],
      ),
    );
  }
}
