import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'welcome_screen.dart';
import 'routes_widget.dart';
import 'history_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: RoutesWidget(screenName: HistoryScreen(), buttonName: 'History Screen'),
              ),
          Expanded(
            child: RoutesWidget(
              screenName: InfoScreen(),
              buttonName: 'Info Screen',
            ),
          ),
          Expanded(
            child: RoutesWidget(
                screenName: WelcomeScreen(), buttonName: 'Welcome Screen'),
          ),
        ],
      ),
    );
  }
}

class InfoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfoScreen(),
    );
  }
}
