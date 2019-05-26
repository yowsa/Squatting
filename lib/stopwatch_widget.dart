import 'package:flutter/material.dart';
import 'stopwatch_timer_class.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:async';
import 'package:squat_mobility/save_squats.dart';
import 'package:squat_mobility/design_elements.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
   // Size iconSize;
    double addSquatButtonPos;
    double timePos;
    double timeSize;
    double iconPosAdjust;
   // Color addTimeColor;
    if (screenHeight < 700) {
      addSquatButtonPos = 0.9;
      timePos = 0.5;
      timeSize = 30.0;
      iconPosAdjust = 0.1;
      //addTimeColor = accentColor;
    } else {
      addSquatButtonPos = 0.8;
      timePos = 0.4;
      timeSize = 34.0;
      iconPosAdjust = 0.0;
      //addTimeColor = backgroundColor;
    }
    return Stack(
      children: [

        Align(
            alignment: Alignment(0.0, timePos),
            child: Text(
              _time,
              style: TextStyle(
                  fontSize: timeSize,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )),
        Align(
          alignment: Alignment(0.0, (0.0+iconPosAdjust)),
          child: FloatingActionButton(
            child: Icon(
              Icons.play_arrow,
              color: textColor,

            ),
            onPressed: testTimer.stopwatchStart,
            backgroundColor: Colors.white,
            heroTag: 1,
          ),
        ),
        Align(
          alignment: Alignment(0.5, (0.05 + iconPosAdjust)),
          child: FloatingActionButton(
              child: Icon(
                Icons.stop,
                color: textColor,
              ),
              backgroundColor: Colors.white,
              onPressed: testTimer.stopwatchStop,
              heroTag: 0),
        ),
        Align(
          alignment: Alignment(-0.5, (0.05+iconPosAdjust)),
          child: FloatingActionButton(
            child: Icon(
              Icons.replay,
              color: textColor,
            ),
            backgroundColor: Colors.white,
            onPressed: testTimer.stopwatchReset,
            heroTag: 2,
          ),
        ),
        Align(
          alignment: Alignment(0.0, addSquatButtonPos),
          child: SizedBox(
            width: 150.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
                addSquat(testTimer.stopwatchValue());
                testTimer.stopwatchReset();

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
