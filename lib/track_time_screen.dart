import 'package:flutter/material.dart';
import 'stopwatch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'time_picker_widget.dart';
import 'save_squats.dart';
import 'stopwatch_timer_class.dart';
import 'package:squat_mobility/squats_today_widget.dart';

class ModalSheet extends StatefulWidget {
  @override
  ModalSheetState createState() => ModalSheetState();
}

class ModalSheetState extends State<ModalSheet> {
  Modal modal = Modal();
  StatefulScreenState modalScreen = StatefulScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.track_changes),
            backgroundColor: Colors.red,
            heroTag: 10,
            onPressed: () => modal.mainBottomSheet(context),
          ),
        ],
      ),
    );
  }
}

class StatefulScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    StatefulScreenState s = StatefulScreenState();
    return s;
  }
}

class StatefulScreenState extends State<StatefulWidget> {
  bool timerState = true;
  bool timePickerState = false;
  Color timerButtonColor = Colors.red;
  Color timePickerButtonColor = Colors.grey;
  Color timerSplashColor;
  Color timePickerSplashColor = Colors.transparent;

  void boop() {
    setState(() {
      if (timerState) {
        timerState = false;
        timePickerState = true;
        timerButtonColor = Colors.grey;
        timerSplashColor = Colors.transparent;
        timePickerButtonColor = Colors.red;
        timePickerSplashColor = Colors.blue;
      } else {
        timerState = true;
        timePickerState = false;
        timerButtonColor = Colors.red;
        timerSplashColor = Colors.blue;
        timePickerButtonColor = Colors.grey;
        timePickerSplashColor = Colors.transparent;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('Timer'),
                    color: timerButtonColor,
                    splashColor: timerSplashColor,
                    onPressed: () {
                      if (timerState) {
                      } else {
                        boop();
                      }
                    }),
                RaisedButton(
                    child: Text('Timer Picker'),
                    color: timePickerButtonColor,
                    splashColor: timePickerSplashColor,
                    onPressed: () {
                      if (timerState) {
                        boop();
                      } else {}
                    }),
              ],
            ),
            Visibility(
                visible: timerState, child: Expanded(child: StopwatchWidget())),
            Visibility(
              visible: timePickerState,
              child: Expanded(child: TimerPickerWidget()),
            ),
          ],
        ),
      ),
    );
  }
}

class Modal {
  bool state = true;
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: StatefulScreen(),
              )
            ],
          );
        });
  }
}

stateChange() {
  bool state = false;
  print(state);
}
