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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: (screenHeight / 4),
          width: screenWidth,
        ),
        /*Positioned(
          bottom: 0.0,
          left: -(screenWidth / 2),
          child: ClipRect(
            child: Container(
              // TODO: sort out what the iconheight is and divide that by two and withdraw that here rather than a solid 25
              height: (screenHeight / 4) - 25.0,
              width: screenWidth * 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.elliptical((screenWidth), (screenWidth / 2)),
                    topRight:
                        Radius.elliptical((screenWidth), (screenWidth / 2))),
              ),
            ),
          ),
        ),*/
        Align(
            alignment: Alignment(0.0, 0.5),
            child: Text(
              _time,
              style: TextStyle(
                  fontSize: 34.0,
                  color: textColor,
                  fontWeight: FontWeight.bold),
            )),
        Align(
          alignment: Alignment(0.0, 0.1),
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
          alignment: Alignment(0.5, 0.15),
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
          alignment: Alignment(-0.5, 0.15),
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
          alignment: Alignment(0.0, 0.8),
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
