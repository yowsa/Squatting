import 'package:flutter/material.dart';
import 'stopwatch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'time_picker_widget.dart';
import 'package:squat_mobility/routes_widget.dart';
import 'package:squat_mobility/design_elements.dart';

class ModalSheet extends StatefulWidget {
  @override
  ModalSheetState createState() => ModalSheetState();
}

class ModalSheetState extends State<ModalSheet> {
  Modal modal = Modal();
  StatefulScreenState modalScreen = StatefulScreenState();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () => modal.mainBottomSheet(context),
          child: Text('ADD TIME', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
          color: mainColor,
          splashColor: accentColor,
          textColor: Colors.white,
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
        ),
      ],
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
  Color timerButtonColor = Colors.white;
  Color timerButtonTextColor = textColor;
  Color timerSplashColor = Colors.transparent;
  Color timePickerButtonColor = mainColor;
  Color timePickerButtonTextColor = Colors.white;
  Color timePickerSplashColor = accentColor;

  void boop() {
    setState(() {
      if (timerState) {
        timerState = false;
        timePickerState = true;
        timerButtonColor = mainColor;
        timerButtonTextColor = Colors.white;
        timerSplashColor = accentColor;
        timePickerButtonColor = Colors.white;
        timePickerButtonTextColor = textColor;
        timePickerSplashColor = Colors.transparent;
      } else {
        timerState = true;
        timePickerState = false;
        timerButtonColor = Colors.white;
        timerButtonTextColor = textColor;
        timerSplashColor = Colors.transparent;
        timePickerButtonColor = mainColor;
        timePickerButtonTextColor = Colors.white;
        timePickerSplashColor = accentColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(flex: 5),
              ButtonTheme(
                minWidth: 140.0,
                child: RaisedButton(
                    child: Text('Timer', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                    color: timerButtonColor,
                    textColor: timerButtonTextColor,
                    splashColor: timerSplashColor,
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    onPressed: () {
                      if (timerState) {
                      } else {
                        boop();
                      }
                    }),
              ),
              Spacer(flex: 1),
              ButtonTheme(
                minWidth: 140.0,
                child: RaisedButton(
                    child: Text('Timer Picker', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                    color: timePickerButtonColor,
                    textColor: timePickerButtonTextColor,
                    splashColor: timePickerSplashColor,
                    padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    onPressed: () {
                      if (timerState) {
                        boop();
                      } else {}
                    }),
              ),
              Spacer(flex: 5),
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                height: (screenHeight/3),
                width: screenWidth,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: (screenHeight / 4),
                  width: screenWidth,
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: -(screenWidth / 2),
                child: ClipRect(
                  child: Container(
                    height: (screenHeight / 4) - 25.0,
                    width: screenWidth * 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft:
                          Radius.elliptical((screenWidth), (screenWidth / 2)),
                          topRight:
                          Radius.elliptical((screenWidth), (screenWidth / 2))),
                    ),
                  ),
                ),
              ),
             Row(
                children: <Widget>[
                  Visibility(
                      visible: timerState, child: Expanded(child: StopwatchWidget())),
                  Visibility(
                    visible: timePickerState,
                    child: Expanded(child: TimerPickerWidget()),
                  ),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class Modal {
  bool state = true;
  mainBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            // TODO: Make flexible height based on screen
            height: (screenHeight/3),
            child: StatefulScreen(),
          );


            /*Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: StatefulScreen(),
              )
            ],
          );*/
        });
  }
}
/*
stateChange() {
  bool state = false;
  print(state);
}*/
