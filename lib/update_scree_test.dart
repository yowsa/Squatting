import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    StatefulScreenState s = StatefulScreenState();
    return s;
  }
}


class StatefulScreenState extends State<StatefulWidget> {
  bool timerState = true;
  bool timepickerState = false;

  void boop() {
    setState(() {
      if (timerState) {
        timerState = false;
        timepickerState = true;
      } else {
        timerState = true;
        timepickerState = false;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              boop();
            },
          ),
          Visibility(visible: timerState, child: Text('Timer'),),
          Visibility(visible: timepickerState,child: Text('Time Picker'),),
        ],
      ),),
    );
  }

}