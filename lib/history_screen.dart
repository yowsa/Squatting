import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:intl/intl.dart';

history() {
  List historyView = <Widget>[];
  List historySum = <Widget>[];
  allSquats['squats'].forEach((k, v) => historyView.add(Text(k)));
  historyView.sort((a, b) => b.data.compareTo(a.data));
  historyView
      .forEach((f) => historySum.add(Text(sumSquats(f.data).toString())));
  return Row(
    children: <Widget>[
      Column(children: historyView),
      Column(children: historySum),
    ],
  );
}

historyList() {
  var dateFormat = DateFormat('yyy-MM-dd');

  List<DateTime> dateList = <DateTime>[];
  allSquats['squats'].forEach((k, v) => dateList.add(DateTime.parse(k)));
  DateTime earliest = dateList.reduce((a, b) => a.isBefore(b) ? a : b);
  DateTime latest = DateTime.now();
  DateTime startDate = earliest;
  DateTime endDate = latest.add(Duration(days: 1));

  while (startDate.add(Duration(days: 1)).isBefore(endDate)) {
    if (dateList.contains(startDate)) {
    } else {
     allSquats['squats'][dateFormat.format(startDate).toString()] = [];
      dateList.add(startDate);
    }
    startDate = startDate.add(Duration(days: 1));
  }

  print(dateList);
  print(allSquats);
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
          history(),
          Container(
            child: historyList(),
          ),
        ],
      ),
    );
  }
}
