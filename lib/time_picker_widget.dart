import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerWidget extends StatefulWidget {
  @override
  _TimerPickerWidgetState createState() => _TimerPickerWidgetState();
}

class _TimerPickerWidgetState extends State<TimerPickerWidget> {
  Duration initialTimer = Duration();

  Widget time() {
    return CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.ms,
        minuteInterval: 1,
        secondInterval: 1,
        initialTimerDuration: initialTimer,
        onTimerDurationChanged: (Duration changedTimer) {
          setState(() {
            initialTimer = changedTimer;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(child: time()),
          Text('hejsan'),
        ],
      ),
    );
  }
}
