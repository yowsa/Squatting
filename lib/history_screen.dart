import 'package:flutter/material.dart';
import 'save_squats.dart';

tesssst() {
  List myList = <Widget>[];
  for (String i in allSquats['squats']) {
    myList.add(Text(i.toString()));
  }
  return Column(children: myList);
}

history() {
  Map<String, dynamic> historyView = {
    "history": {
    },
  };


  //return Column(children: historyView);


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
