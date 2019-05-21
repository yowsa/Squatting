import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squat_mobility/design_elements.dart';

Future<void> setVisited() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('newUser', false);
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double ovalHeight = ((screenHeight * 0.70) / 2);
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
            top: (screenHeight - ovalHeight) / 2,
            left: -(screenWidth / 2),

            child: ClipRect(
              child: Container(
                height: ovalHeight,
                width: ovalWidth,
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
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
                        style: TextStyle(color: textColor, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth / 2 - (buttonSize.width / 2),
            top: (screenHeight - ovalHeight) - (buttonSize.height/4),
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
