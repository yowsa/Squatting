import 'package:flutter/material.dart';
import 'package:squat_mobility/stopwatch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:squat_mobility/time_picker_widget.dart';
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
          child: Text(
            'ADD TIME',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          color: mainColor,
          splashColor: accentColor,
          textColor: Colors.white,
          padding:
              EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
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
  Color timerButtonColor = mainColor;
  Color timerButtonTextColor = Colors.white;
  Color timerSplashColor = Colors.transparent;

  Color timePickerButtonColor = Colors.white;
  Color timePickerButtonTextColor = textColor;
  Color timePickerSplashColor = accentColor;
  double timerButtonElevation = 0.0;
  double timePickerButtonElevation = 3.0;

  void boop() {
    setState(() {
      if (timerState) {
        timerState = false;
        timePickerState = true;
        timerButtonColor = Colors.white;
        timerButtonTextColor = textColor;
        timerSplashColor = accentColor;
        timePickerButtonColor = mainColor;
        timePickerButtonTextColor = Colors.white;
        timePickerSplashColor = Colors.transparent;
        timerButtonElevation = 3.0;
        timePickerButtonElevation = 0.0;
      } else {
        timerState = true;
        timePickerState = false;

        timerButtonColor = mainColor;
        timerButtonTextColor = Colors.white;
        timerSplashColor = Colors.transparent;
        timePickerButtonColor = Colors.white;
        timePickerButtonTextColor = textColor;
        timePickerSplashColor = accentColor;
        timerButtonElevation = 0.0;
        timePickerButtonElevation = 3.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double ovalHeight = ((screenHeight * 0.50) / 2) - 30.0;
    double ovalWidth = screenWidth * 2;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: (screenHeight * 0.45),
                width: screenWidth,
              ),
              Positioned(
                bottom: 0.0,
                left: -(screenWidth / 2),
                child: ClipRect(
                  child: Container(
                    height: ovalHeight,
                    width: ovalWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.elliptical((ovalWidth), (ovalWidth / 3)),
                          topRight:
                              Radius.elliptical((ovalWidth), (ovalWidth / 3))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Text(
                  'Use the timer or time picker to log time',
                  style: TextStyle(color: textColor),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 140.0,
                      child: RaisedButton(
                          child: Text(
                            'TIMER',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          color: timerButtonColor,
                          textColor: timerButtonTextColor,
                          splashColor: timerSplashColor,
                          elevation: timerButtonElevation,
                          padding: EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                          onPressed: () {
                            if (timerState) {
                            } else {
                              boop();
                            }
                          }),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ButtonTheme(
                      minWidth: 140.0,
                      child: RaisedButton(
                          child: Text(
                            'TIME PICKER',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          color: timePickerButtonColor,
                          textColor: timePickerButtonTextColor,
                          splashColor: timePickerSplashColor,
                          elevation: timePickerButtonElevation,
                          padding: EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 10.0, bottom: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                          onPressed: () {
                            if (timerState) {
                              boop();
                            } else {}
                          }),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Visibility(
                      visible: timerState,
                      child: Container(
                          height: screenHeight * 0.45,
                          width: screenWidth,
                          child: StopwatchWidget())),
                  Visibility(
                    visible: timePickerState,
                    child: Container(
                        height: screenHeight * 0.45,
                        width: screenWidth,
                        child: TimerPickerWidget()),
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
  //bool state = true;
  mainBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: (screenHeight * 0.45),
            child: StatefulScreen(),
          );
        });
  }
}
