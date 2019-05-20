import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'history_screen.dart';
import 'track_time_screen.dart';
import 'squats_today_widget.dart';
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
    double ovalHeight = ((screenHeight * 0.50) / 2) - 30.0;
    double ovalWidth = screenWidth * 2;
    double iconSize = 25.0;
    var circularChart = SquatsCircularChartWidget(key: chartKey);
    return Scaffold(
      backgroundColor: backgroundColor,
      /* appBar: AppBar(
        backgroundColor: menuColor,
        title: Text('SQUATTING'),
      ),*/
      body: Column(
        children: <Widget>[
          Container(
            child: circularChart,
          ),
          Spacer(flex: 1,),
          Expanded(
            child: ModalSheet(),
          ),
          Stack(
            children: <Widget>[
              Container(
                height: (screenHeight/4),
                width: screenWidth,
              ),
              Positioned(
                bottom: 0.0,
                left: -(screenWidth/2),

                child: ClipRect (
                  child: Container(
                    height: ovalHeight,
                    width: ovalWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(
                              (ovalWidth), (ovalWidth / 3)),
                          topRight: Radius.elliptical(
                              (ovalWidth), (ovalWidth / 3))),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.5, 0),
                //child: Container(
                  //alignment: Alignment(-1, 0),
                  child: SizedBox(
                    height: (screenWidth/6),
                    width: (screenWidth/6),
                    child: FloatingActionButton(
                      heroTag: 3,
                      backgroundColor: mainColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoScreen()));
                      },
                      child: Icon(Icons.info),
                    ),
                 // ),
                ),
              ),
              Align(
                alignment: Alignment(0.5, 0.0),
                child: SizedBox(
                  height: (screenWidth/6),
                  width: (screenWidth/6),
                  child: FloatingActionButton(
                    heroTag: 2,
                    backgroundColor: mainColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryScreen()));
                    },
                    child: Icon(Icons.assessment),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
