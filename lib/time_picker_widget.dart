import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:squat_mobility/design_elements.dart';

class TimerPickerWidget extends StatefulWidget {
  @override
  _TimerPickerWidgetState createState() => _TimerPickerWidgetState();
}

class _TimerPickerWidgetState extends State<TimerPickerWidget> {
  //Modal modal = Modal();
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
    return Stack(
      children: <Widget>[
        /*
        Expanded(
          child: FloatingActionButton(
              child: Icon(Icons.add),
              heroTag: 3,
              onPressed: () {
                Navigator.pop(context);
                addSquat(initialTimer);
              }),
        ),*/

        Container(height: 100.0,child: time()),
        Align(
          alignment: Alignment(0.0, 0.8),
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
                  Icon(Icons.add_circle_outline, size: 15.0,),
                  Text(
                    ' ADD TIME',
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              color: backgroundColor,
              splashColor: accentColor,
              textColor: textColor,
              //padding:
              //    EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0))),
            ),
          ),
        ),
      ],
    );

  }
}
