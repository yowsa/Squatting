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
  Modal modal = Modal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            heroTag: 10,
            onPressed: () => modal.mainBottomSheet(context),
          ),
        ],
      ),
    );
  }
}

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
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
              Expanded(
                child: FloatingActionButton(
                    child: Icon(Icons.add),
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
