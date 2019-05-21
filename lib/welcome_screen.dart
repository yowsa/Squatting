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
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // TODO: unhide set visited for welcome screen to only be visible firts time
            //setVisited();
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: Text('Go to main screen!'),
        ),
      ),
    );
  }
}
