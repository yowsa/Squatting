import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'welcome_screen.dart';
import 'routes_widget.dart';
import 'history_screen.dart';
//import 'package:redux_persist/redux_persist.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'stopwatch_widget.dart';
import 'track_time_screen.dart';
import 'time_picker_widget.dart';
import 'save_squats.dart';
import 'squats_today_widget.dart';

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

class MainScreen extends StatelessWidget {
  Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: RoutesWidget(
                screenName: HistoryScreen(), buttonName: 'History Screen'),
          ),
          Expanded(
            child: RoutesWidget(
              screenName: InfoScreen(),
              buttonName: 'Info Screen',
            ),
          ),
          Text(allSquats.toString()),
          Expanded(
            child: RoutesWidget(screenName: TrackTimeScreen(), buttonName: 'Track Time'),
          ),
          FloatingActionButton(
            onPressed: () => modal.mainBottomSheet(context),
          )
        ],
      ),
    );
  }
}
