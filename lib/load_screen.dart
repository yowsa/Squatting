import 'package:flutter/material.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/welcome_screen.dart';
import 'package:squat_mobility/main.dart';
import 'package:squat_mobility/history_screen.dart';
import 'package:squat_mobility/design_elements.dart';

Future<void> sleep() async {
  return Future.delayed(Duration(seconds: 1));
}


void main() async  {
 runApp(MaterialApp(title: 'Load Screen', home: LoadScreen()));
  await loadSquats();
 await historyList();
 await sleep();
  runApp(MaterialApp(title: 'Welcome Screen', home: MainScreen()));
}



class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text('Load Screen'),
      ),
    );
  }

}