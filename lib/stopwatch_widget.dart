import 'package:flutter/material.dart';
import 'stopwatch_timer_class.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:async';

class StopwatchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    StopwatchState s = StopwatchState();
    //var func = () => s.boop();
    testTimer.setCallback(s.boop);
    return s;
  }
}

class StopwatchState extends State<StopwatchWidget> {
  String _time = testTimer.stopwatchPrint();

  void boop() {
    setState(() {
      _time = testTimer.stopwatchPrint();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: testTimer.stopwatchStart,
          backgroundColor: Colors.green,
          heroTag: 1,
        ),
        Text(_time),
        FloatingActionButton(
            child: Icon(Icons.stop),
            onPressed: testTimer.stopwatchStop, heroTag: 0),
        FloatingActionButton(
          child: Icon(Icons.receipt),
          onPressed: testTimer.stopwatchReset, heroTag: 2,
        ),
      ],
    );
  }
}
