import 'package:flutter/material.dart';
import 'stopwatch_timer_class.dart';
import 'dart:async';

class StopwatchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    StopwatchState s = StopwatchState();
    //var func = () => s.boop();
    testTimer.setCallback(s.boop);

   // Timer.periodic(Duration(milliseconds: 100), func);
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
          onPressed: testTimer.stopwatchStart,

          backgroundColor: Colors.green,
          heroTag: 1,
        ),
        Text(_time),
        FloatingActionButton(onPressed: testTimer.stopwatchStop, heroTag: 0),
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
