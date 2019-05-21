import 'package:flutter/material.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/welcome_screen.dart';
import 'package:squat_mobility/main.dart';
import 'package:squat_mobility/history_screen.dart';
import 'package:squat_mobility/design_elements.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sleep() async {
  return Future.delayed(Duration(seconds: 3));
}


void main() async {
  runApp(MaterialApp(title: 'Load Screen', home: LoadScreen()));
  await loadSquats();
  await historyList();
  await sleep();

  final prefs = await SharedPreferences.getInstance();

  final newUser = prefs.getBool('newUser') ?? true;
  // TODO: remove line below so the saved prefs for welcome screen doesn't reset every other time
  prefs.remove('newUser');

  newUser
      ? runApp(MaterialApp(title: 'Navigation Basics', home: WelcomeScreen()))
      : runApp(MaterialApp(title: 'Navigation Basics', home: MainScreen()));
  //(MaterialApp(title: 'Welcome Screen', home: MainScreen()));
}

class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var backgroundLogo = AssetImage('assets/test-image.png');
    var image = Image(image: backgroundLogo, width: 100.0, height: 100.0,)
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Text('loading', style: TextStyle(fontSize: 65),),
            Container(child: image,),
          ],
        ),
      ),
    );
  }
}
