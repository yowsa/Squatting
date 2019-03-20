import 'package:flutter/material.dart';
import 'stopwatch_timer_class.dart';
import 'dart:async';

class StopwatchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    StopwatchState s = StopwatchState();
    var func = (Timer timer) => s.boop();
    Timer.periodic(Duration(milliseconds: 100), func);
    // TODO: implement createState
    return s;
  }
}

class StopwatchState extends State<StopwatchWidget> {
  String _time = 'time';

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
          onPressed: testTimer.stopwatchStart,
          backgroundColor: Colors.green,
        ),
        Text(_time),
        FloatingActionButton(onPressed: testTimer.stopwatchStop),
        Container(
          color: Colors.blue,
          child: Text('hajja'),
        ),
        Text('hejsan'),
        Text('hojabaaaaa'),
      ],
    );
  }
}
