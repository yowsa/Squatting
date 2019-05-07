import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:intl/intl.dart';

history() {
  List historyView = <Widget>[];
  List historySumDouble = [];
  List historySum = <Widget>[];
  allSquats['squats'].forEach((k, v) {
    historyView.add(Text(k));
  });

  historyView.sort((a, b) => b.data.compareTo(a.data));

  historyView.forEach((f) {
    historySumDouble.add(sumSquats(f.data)/30);
  });


  return ListView.separated(
    shrinkWrap: true,
    itemCount: historyView.length,
    itemBuilder: (BuildContext context, int index) {
      historySum.add(Text(sumSquats(historyView[index].data).toString()));
      double fullWidth = MediaQuery.of(context).size.width;
      double squatPercentageWidth = fullWidth * historySumDouble[index];

    return Stack(
      children: <Widget>[

        Container(
          color: Colors.blueGrey,
          height: 50.0,
          width: fullWidth,
        ),
        Container(
          height: 50.0,
          width: squatPercentageWidth,
          color: Colors.red,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            alignment: Alignment(-1.0, 0.0),
            height: 50.0,
            width: 150.0,
            child: historyView[index],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            alignment: Alignment(1.0, 0.0),
            height: 50.0,
            width: 100.0,
            child: historySum[index],
          ),
        ),
      ],

    );




    },
    separatorBuilder: (context, position) {
      return Container(
        width: 300.0,
        height: 10.0,
        color: Colors.white,

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
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
