import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squat_mobility/design_elements.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/history_screen.dart';

Future<void> setVisited() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('newUser', false);
}

class WelcomeScreen extends StatelessWidget {
  final today = DateTime.now().toString().substring(0, 10);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double ovalHeight = (screenHeight * 0.70) / 2;
    double bottomPosition;
    if (screenHeight < 800) {
      ovalHeight = 300.0;
      bottomPosition = (screenHeight/2)-150.0;
    }else {
      ovalHeight = ((screenHeight * 0.70) / 2);
      bottomPosition = (screenHeight - ovalHeight)/2;
    }
    double ovalWidth = screenWidth * 2;
    Size buttonSize = Size(200, 80);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: screenWidth,
            height: screenHeight,
          ),
          Positioned(
            //alignment: Alignment.center,
            bottom: bottomPosition,
            left: -(screenWidth / 2),

            child: ClipRect(
              child: Container(
                height: ovalHeight,
                width: ovalWidth,
                padding: EdgeInsets.only(top: ovalHeight*0.15, bottom: 30.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                      bottomLeft:
                          Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                      bottomRight:
                          Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                      topRight:
                          Radius.elliptical((ovalWidth), (ovalWidth / 3))),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'WELCOME TO',
                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      'squatting',
                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 65),
                    ),
                    Text(
                      'Rest in squat position for 30\nminutes each day to increase\nhip, ankle and back mobility. ',
                      style: TextStyle(color: textColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth / 2 - (buttonSize.width / 2),
            bottom: bottomPosition - (buttonSize.height/2),
            child: SizedBox(
              height: buttonSize.height,
              width: buttonSize.width,
              child: RaisedButton(
                //padding: EdgeInsets.all(20),
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                onPressed: () {
                  // TODO: unhide set visited for welcome screen to only be visible firts time
                  //setVisited();
                  allSquats['squats'][today] = [
                  ];
                  historyList();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Text(
                  'START\nSQUATTING',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
