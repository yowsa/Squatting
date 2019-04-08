import 'package:flutter/material.dart';
import 'save_squats.dart';

tesssst() {
  List myList = <Widget>[];
  for (int i in allSquats['squats']['datum']) {
    myList.add(Text(i.toString()));
  }
  return Column(children: myList);
}


class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Screen'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back to main screen!'),
          ),
          tesssst(),
        ],

      ),
    );
  }
}
