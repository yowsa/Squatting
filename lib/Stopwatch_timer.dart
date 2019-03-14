import 'dart:async';
import 'package:intl/intl.dart';

var myStopwatch = new Stopwatch();

Timer timer;

var elapsedTime = myStopwatch.elapsed;

updateTime(Timer theTimer) {
  String printTime = DateFormat("mm:ss:S").format(
      DateTime(0).add(Duration(milliseconds: myStopwatch.elapsedMilliseconds)));
  print(printTime.substring(0, 8));

  if (myStopwatch.elapsed >= Duration(seconds: 5)) {
    theTimer.cancel();
  }
}

stopwatchStart() {
  myStopwatch.start();
  timer = Timer.periodic(
      Duration(milliseconds: 100), (theTimer) => updateTime(theTimer));
}

stopwatchStop() {
  myStopwatch.stop();
}

class SquatStopwatch {
  my_method() {
    print('hej');
  }
}

var main_timer = SquatStopwatch();
main() {
  main_timer.my_method();
  stopwatchStart();
}
