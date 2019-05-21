import 'package:flutter/material.dart';
import 'save_squats.dart';
import 'package:intl/intl.dart';
import 'package:squat_mobility/design_elements.dart';

history() {
  List historyView = <Widget>[];
  List historySumDouble = [];
  List historySum = <Widget>[];
  allSquats['squats'].forEach((k, v) {
    historyView.add(Text(k, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18.0)));
  });

  historyView.sort((a, b) => b.data.compareTo(a.data));

  historyView.forEach((f) {
    historySumDouble.add(sumSquats(f.data) / 30);
  });

  return ListView.separated(
    shrinkWrap: true,
    itemCount: historyView.length,
    itemBuilder: (BuildContext context, int index) {
      historySum.add(Text(sumSquats(historyView[index].data).toString() + ' min', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18.0)));
      double fullWidth = MediaQuery.of(context).size.width;
      double squatPercentageWidth;
      if ((fullWidth * historySumDouble[index]) > fullWidth) {
        squatPercentageWidth = fullWidth;
      } else {
        squatPercentageWidth = fullWidth * historySumDouble[index];
      }

      return Stack(
        children: <Widget>[
          Container(
            height: 55.0,
            width: fullWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          Container(
            height: 55.0,
            width: squatPercentageWidth,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                alignment: Alignment(-1.0, 0.0),
                height: 55.0,
                width: (fullWidth / 2),
                child: historyView[index],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                alignment: Alignment(1.0, 0.0),
                height: 55.0,
                width: (fullWidth / 2),
                child: historySum[index],
              ),
            ),
          ),
        ],
      );
    },
    separatorBuilder: (context, position) {
      return Container(
        width: 300.0,
        height: 10.0,
      );
    },
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
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Squat History'),
        backgroundColor: menuColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: history(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
