import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerWidget extends StatefulWidget {
  @override
  _TimerPickerWidgetState createState() => _TimerPickerWidgetState();
}

class _TimerPickerWidgetState extends State<TimerPickerWidget> {
  Duration initialTimer = Duration();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Container(
          child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.ms,
              minuteInterval: 1,
              secondInterval: 1,
              initialTimerDuration: initialTimer,
              onTimerDurationChanged: (Duration changedTimer) {
                setState(() {
                  initialTimer = changedTimer;
                });
              }),
        )
      ],
    );
  }
}
