import 'package:flutter/material.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/welcome_screen.dart';
import 'package:squat_mobility/main_screen.dart';
import 'package:squat_mobility/history_screen.dart';
import 'package:squat_mobility/design_elements.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'dart:async';

Future<void> sleep() async {
  return Future.delayed(Duration(seconds: 3));
}

void main() async {
  final prefs = await SharedPreferences.getInstance();
  final newUser = prefs.getBool('newUser') ?? true;
  // to reset "new User" run code below
  //prefs.remove('newUser');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(title: 'Load Screen', home: LoadScreen()));
  });

  await loadSquats();
  historyList();
  await sleep();

  newUser == true
      ? runApp(MaterialApp( title: 'Squatting', debugShowCheckedModeBanner: false, home: WelcomeScreen()))
      : runApp(MaterialApp( title: 'Squatting', debugShowCheckedModeBanner: false, home: Main()));
}

class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var backgroundLogo = AssetImage('assets/light-logo-big.png');
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
            top: (screenHeight - ovalHeight) / 2,
            left: -(screenWidth / 2),
            child: ClipRect(
              child: Container(
                height: ovalHeight,
                width: ovalWidth,
                padding: EdgeInsets.only(top: ovalHeight * 0.15, bottom: 30.0),
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
          Center(
              child: Text(
            'squatting',
            style: TextStyle(
                fontSize: 65, fontWeight: FontWeight.bold, color: textColor),
          )),
        ],
      ),
    );
  }
}
