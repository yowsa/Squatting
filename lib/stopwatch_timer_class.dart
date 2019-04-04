import 'dart:async';
import 'package:intl/intl.dart';

// TODO: only needed for the sleep function for testing
//import 'dart:io';
//import 'stopwatch_widget.dart';

class StopwatchTimer {
  Stopwatch myStopwatch;

  var callback;

  Timer timer;

  StopwatchTimer() {
    myStopwatch = Stopwatch();
  }

  // printing the current time of the timer
  updateTime(Timer theTimer) {
    String printTime = DateFormat("mm:ss:S").format(
        DateTime.fromMillisecondsSinceEpoch(myStopwatch.elapsedMilliseconds));
    if (callback != null) callback();

    //TODO: only here for testing mode, remove once a stop button is implemented
   // if (myStopwatch.elapsed >= Duration(seconds: 5)) {
   //   theTimer.cancel();
   //   print(myStopwatch.elapsed.toString() + 'hejsan');
   //   myStopwatch.reset();
   //   print(myStopwatch.elapsed.toString() + 'hejsan2');
   // }
  }

  // printing the start time
  stopwatchPrint() {
    String printStartTime = DateFormat("mm:ss:S").format(
        DateTime.fromMillisecondsSinceEpoch(myStopwatch.elapsedMilliseconds));
    return printStartTime.substring(0, 8);
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
    timer.cancel();
  }

  stopwatchReset() {
    myStopwatch.reset();
    print(myStopwatch.elapsed);
  }

  setCallback(cb) {
    this.callback = cb;
  }


}


//TODO: test section, this would be what goes into the actual app using the timer

var testTimer = StopwatchTimer();

//main() {
  // printing the start time
//  testTimer.stopwatchPrint();
  // added for testing
//  sleep(Duration(seconds: 2));
  // starting the actual timer
//  testTimer.stopwatchStart();
//}
