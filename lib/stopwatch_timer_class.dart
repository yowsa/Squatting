import 'dart:async';
import 'package:intl/intl.dart';

// TODO: only needed for the sleep function for testing
import 'dart:io';

class SquatStopwatch {
  Stopwatch myStopwatch;

  String printStartTime = DateFormat("mm:ss:S").format(DateTime(0));

  Timer timer;

  SquatStopwatch() {
    myStopwatch = Stopwatch();
  }

  // printing the current time of the timer
  updateTime(Timer theTimer) {
    String printTime = DateFormat("mm:ss:S").format(
        DateTime.fromMillisecondsSinceEpoch(myStopwatch.elapsedMilliseconds));
    print(printTime.substring(0, 8));

    //only here for testing mode, remove once a stop button is implemented
    if (myStopwatch.elapsed >= Duration(seconds: 5)) {
      theTimer.cancel();
      print(myStopwatch.elapsed.toString() + 'hejsan');
      myStopwatch.reset();
      print(myStopwatch.elapsed.toString() + 'hejsan2');
    }
  }

  // printing the start time
  stopwatchPrint() {
    print(printStartTime.substring(0, 8));
  }

  // starting the timer and updating the current elapsed time every 100th millisecond
  stopwatchStart() {
    myStopwatch.start();
    timer = Timer.periodic(
        Duration(milliseconds: 100), (theTimer) => updateTime(theTimer));
  }

  // stops the timer
  stopwatchStop() {
    myStopwatch.stop();
  }

  stopwatchReset() {
    myStopwatch.reset();
    print(myStopwatch.elapsed);
  }
}

//test section, this would be what goes into the actual app using the timer
var testTimer = SquatStopwatch();

main() {
  // printing the start time
  testTimer.stopwatchPrint();
  // added for testing
  sleep(Duration(seconds: 2));
  // starting the actual timer
  testTimer.stopwatchStart();
}
