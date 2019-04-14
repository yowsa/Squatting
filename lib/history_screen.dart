import 'package:flutter/material.dart';
import 'save_squats.dart';

history() {
  List historyView = <Widget> [];
  List historySum = <Widget> [];
  allSquats['squats'].forEach((k, v) => historyView.add(Text(k)));
 historyView.sort((a,b) => a.data.compareTo(b.data));
 historyView.forEach((f) => historySum.add(Text(sumSquats(f.data).toString())));
  return Row(children: <Widget>[
      Column(children: historyView),
    Column(children: historySum),
  ],);


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

        ],

      ),
    );
  }
}
