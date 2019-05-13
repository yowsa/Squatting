import 'package:flutter/material.dart';
import 'stopwatch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'time_picker_widget.dart';
import 'save_squats.dart';
import 'stopwatch_timer_class.dart';

class ModalSheet extends StatefulWidget {
  @override
  ModalSheetState createState() => ModalSheetState();
}

class ModalSheetState extends State<ModalSheet> {
  //bool timerState = true;
  //bool timePickerState = false;
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
            Visibility(visible: timerState, child: Text('noe'),),
            Visibility(visible: timepickerState,child: Text('nooooo Picker'),),
          ],
        ),),
    );
  }


  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Center(
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
            ),);




        });
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
                //Visibility(visible: state, child: Text('field 1')),
                ///Visibility(visible: true, child: Text('field 2')),
                Expanded(
                  child: StatefulScreen(),
                )
                /*Expanded(
                  child: FloatingActionButton(
                      child: Icon(Icons.add),
                      backgroundColor: Colors.red,
                      heroTag: 4,
                      onPressed: () => stateChange()
                  ),
                ),*/
              ],
            );

        });
  }
}

stateChange() {
  bool state = false;
  print(state);
}








// Original code for the modal bottom sheet
/*
class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: FloatingActionButton(
                    child: Icon(Icons.add),
                    backgroundColor: Colors.red,
                    heroTag: 4,
                    onPressed: () => addSquat(testTimer.stopwatchValue())),
              ),
              Expanded(
                child: StopwatchWidget(),
              ),
              Expanded(
                child: TimerPickerWidget(),
              ),
            ],
          );
        });
  }
}
*/
