import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/design_elements.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double timePickerPos;
    if (screenHeight < 700) {
      timePickerPos = 1.0;
    } else {
      timePickerPos = 0.7;
    }
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment(0.0, timePickerPos),
            child: Container(height: 100.0, child: time())),
        Align(
          alignment: Alignment(0.0, 0.1),
          child: SizedBox(
            width: 150.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                addSquat(initialTimer);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 15.0,
                  ),
                  Text(
                    ' ADD TIME',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              color: Colors.white,
              splashColor: accentColor,
              textColor: textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0))),
            ),
          ),
        ),
      ],
    );
  }
}
