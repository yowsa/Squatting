import 'package:flutter/material.dart';
import 'save_squats.dart';

var goal = 30.00;

class SquatsTodayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SquatsTodayState squatsToday = SquatsTodayState();

    return squatsToday;

  }
}


class SquatsTodayState extends State<SquatsTodayWidget> {
  var todaysSquats =  allSquats['squats']['datum'];

  void loadState() {
    setState(() {
      todaysSquats = (allSquats['squats']['datum'].toString());
    });
}


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Expanded(
          child: Text(todaysSquats.toString()),
        )
      ],
    );
  }
}