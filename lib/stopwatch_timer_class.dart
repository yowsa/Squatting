import 'dart:async';
import 'package:intl/intl.dart';

class StopwatchTimer {
  Stopwatch myStopwatch;

  var callback;

  Timer timer;

  StopwatchTimer() {
    myStopwatch = Stopwatch();
  }

  // printing the current time of the timer
  updateTime() {
    if (callback != null) callback();
  }

  // printing the start time
  stopwatchPrint() {
    String printStartTime = DateFormat("mm:ss:S").format(
        DateTime.fromMillisecondsSinceEpoch(myStopwatch.elapsedMilliseconds));
    return printStartTime.substring(0, 8);
  }

  stopwatchValue() {
    Duration stopwatchValue =
        Duration(milliseconds: myStopwatch.elapsedMilliseconds);
    return stopwatchValue;
  }

  // starting the timer and updating the current elapsed time every 100th millisecond
  stopwatchStart() {
    myStopwatch.start();
    timer =
        Timer.periodic(Duration(milliseconds: 100), (theTimer) => updateTime());
  }

  // stops the timer
  stopwatchStop() {
    if (myStopwatch.isRunning) {
      myStopwatch.stop();
      timer.cancel();
    }
  }

  stopwatchReset() {
    myStopwatch.reset();
    updateTime();
  }

  setCallback(cb) {
    this.callback = cb;
  }

  isRunning() {
    if (myStopwatch.isRunning) {
      return true;
    } else {
      return false;
    }
  }
}

//TODO: test section, this would be what goes into the actual app using the timer

var testTimer = StopwatchTimer();
