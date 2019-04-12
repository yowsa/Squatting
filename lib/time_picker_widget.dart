import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'track_time_screen.dart';

class TimerPickerWidget extends StatefulWidget {
  @override
  _TimerPickerWidgetState createState() => _TimerPickerWidgetState();
}

class _TimerPickerWidgetState extends State<TimerPickerWidget> {
  Modal modal = Modal();
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: FloatingActionButton(child: Icon(Icons.add),heroTag: 3,onPressed:() => addSquat(initialTimer)),
          ),
          Expanded(child: time()),
          FloatingActionButton(heroTag: 10,
            onPressed: () => modal.mainBottomSheet(context),
          ),

        ],
      ),
    );
  }
}
