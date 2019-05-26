import 'package:flutter/material.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/welcome_screen.dart';
import 'package:squat_mobility/main.dart';
import 'package:squat_mobility/history_screen.dart';
import 'package:squat_mobility/design_elements.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

Future<void> sleep() async {
  return Future.delayed(Duration(seconds: 6));
}

void main() async {
  final prefs = await SharedPreferences.getInstance();

  final newUser = prefs.getBool('newUser') ?? true;
  // TODO: remove line below so the saved prefs for welcome screen doesn't reset every other time
  prefs.remove('newUser');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MaterialApp(title: 'Load Screen', home: LoadScreen()));
  });


  await loadSquats();
  if (newUser == false) {
    historyList();
  }
  ;

  await sleep();

  newUser
      ? runApp(MaterialApp(title: 'Navigation Basics', home: WelcomeScreen()))
      : runApp(MaterialApp(title: 'Navigation Basics', home: MainScreen()));
  //(MaterialApp(title: 'Welcome Screen', home: MainScreen()));
}

class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var backgroundLogo = AssetImage('assets/dark-logo.png');
    var image = Image(
      image: backgroundLogo,
      width: 300.0,
      height: 300.0,
    );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double ovalWidth = screenWidth * 2;
    double ovalHeight = (screenHeight * 0.70) / 2;
    if (screenHeight < 700) {
      ovalHeight = 300.0;
    } else {
      ovalHeight = ((screenHeight * 0.70) / 2);
    }

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
            top: (screenHeight-ovalHeight)/2,
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
                child: image,
              ),
            ),
          ),

        ],
      ),








      /*
      Center(
        child: ClipRect(
          child: Container(
            height: ovalHeight,
            width: ovalWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                  bottomLeft: Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                  bottomRight: Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                  topRight: Radius.elliptical((ovalWidth), (ovalWidth / 3))),
            ),
            child: image,
          ),
        ),
      ),*/

/*
      ClipRect(
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

      */
    );
  }
}
