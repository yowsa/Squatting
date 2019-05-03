import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:intl/intl.dart';

history() {
  List historyView = <Widget>[];
  List historySum = <Widget>[];
  //Map teztMap = {};
  allSquats['squats'].forEach((k, v) {
    historyView.add(Text(k));
  });

  historyView.sort((a, b) => b.data.compareTo(a.data));
  historyView.forEach((f) {
    historySum.add(Text(sumSquats(f.data).toString()));
  });
 /* historyView.forEach((f) {
    teztMap[f] = sumSquats(f.data).toString();
  });
  Map teztMap2 = Map.fromIterables(historyView, historySum);
  print(teztMap);
  print(teztMap2);*/




  return ListView.builder(
    shrinkWrap: true,
    itemCount: historyView.length,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: historyView[index],
      subtitle: historySum[index],
    );
    },
  );




  /*return Row(
    children: <Widget>[
      Container(
        color: Colors.cyan,
        child: Column(children: historyView),
      ),
      Column(children: historySum),
    ],
  );*/
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
}

class HistoryScreen extends StatelessWidget {
  int a = sumSquats('2019-04-14');
  double soFar = ((100.0 / 30.0) * 20);
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double soFar2 = fullWidth * (soFar / 100);
    return Scaffold(
      appBar: AppBar(
        title: Text('History Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: history(),
          ),
          Container(
            child: historyList(),
          ),
          Stack(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                height: 50.0,
                width: fullWidth,
              ),
              Container(
                height: 50.0,
                width: soFar2,
                color: Colors.red,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  child: Text('date'),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  child: Text('minutes'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
