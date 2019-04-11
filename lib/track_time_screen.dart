import 'package:flutter/material.dart';
import 'stopwatch_widget.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'time_picker_widget.dart';
import 'save_squats.dart';
import 'stopwatch_timer_class.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.message),
                title: Text('hej1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('hej2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

            ],
          );





        });
  }
}

class TrackTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          Expanded(
            child: FloatingActionButton(
                child: Icon(Icons.add),
                heroTag: 4,
                onPressed: () => addSquat(testTimer.stopwatchPrint())),
          ),
          Expanded(
            child: StopwatchWidget(),
          ),
          Expanded(
            child: TimerPickerWidget(),
          )
        ],
      ),
    );
  }
}
