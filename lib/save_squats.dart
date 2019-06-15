import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:squat_mobility/main_screen.dart';
import 'dart:async';

// Global variable that holds all squats (dict/map)

Map<String, dynamic> allSquats = {
  "squats": {},
};

// function that check the total sum of todays squats from the allSquats variable

sumSquats(day) {
  Duration dayTotal = Duration(
    milliseconds: 0,
    minutes: 0,
    seconds: 0,
  );
  int total = dayTotal.inMinutes;
  if (allSquats['squats'].containsKey(day)) {
    for (int seconds in allSquats['squats'][day]) {
      Duration dur;
      dur = Duration(seconds: seconds);
      dayTotal += dur;
      total = dayTotal.inMinutes;
    }
    return total;
  } else {
    return total;
  }
}

// function that loads saved items at start

Future<void> loadSquats() async {
  var decoder = JsonDecoder();

  var prefs = await SharedPreferences.getInstance();
  var allSavedSquats = prefs.getString('squats');
  if (allSavedSquats != null) {
    var stringToMapSquats = decoder.convert(allSavedSquats);
    allSquats = Map<String, dynamic>.from(stringToMapSquats);
  }
}

// function that makes saved items into a string and saves it

Future<bool> saveSquats() async {
  var encoder = JsonEncoder();
  String savedSquatsString = encoder.convert(allSquats);

  var savedSquats = await SharedPreferences.getInstance();
  savedSquats.setString('squats', savedSquatsString);

  return true;
}

Future<void> sleep() async {
  return Future.delayed(Duration(milliseconds: 400));
}

void delayedCircularChartAnimation() async {
  await sleep();
  chartKey.currentState.squatsCircularChartSetState();
}

addSquat(squatValue) {
  int squatValueSeconds = squatValue.inSeconds;
  var today = DateTime.now().toString().substring(0, 10);
  if (allSquats['squats'].containsKey(today)) {
    allSquats['squats'][today].add(squatValueSeconds);
  } else {
    allSquats['squats'][today] = [
      squatValueSeconds,
    ];
  }
  delayedCircularChartAnimation();

  // if I want to remove a date, use the code below
  //allSquats['squats'].remove('2019-06-04');

//If you want to add a date with value use code below

  //allSquats['squats']['2019-04-11'] = [4, 5, 6, 7];

  saveSquats();
}
