import 'package:flutter/material.dart';
import 'stopwatch_widget.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'time_picker_widget.dart';

class TrackTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          Expanded(
            child: Text('hejsgyjfjhffan'),
          ),
          Expanded(
            child: StopwatchWidget(),
          ),
          //Expanded (
          //  child: TimerPickerWidget(),
          //),
        ],
      ),
    );
  }
}
