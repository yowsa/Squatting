import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'squats_today_widget.dart';
import 'package:intl/intl.dart';

// Global variable that holds all squats (dict/map)

Map<String, dynamic> allSquats = {
  "squats": {
    "datum": [1, 4, 3]
  },
};

// function that check the total sum of todays squats from the allSquats variable

sumSquats() {
  Duration todaysTotal = Duration(
    milliseconds: 0,
    minutes: 0,
    seconds: 0,
  );
  var today = DateTime.now().toString().substring(0,10); // is it better to make this a universal variable since it's also used in the addsquat function futher down
  if (allSquats['squats'].containsKey(today)){
    for (int seconds in allSquats['squats'][today]) {
      Duration dur;
      dur = Duration(seconds: seconds);
      todaysTotal += dur;
      return todaysTotal;

    }
  } else {
    return todaysTotal;
  }
  print(todaysTotal);
}


// function that loads saved items at start

loadSquats() async {
//  int squatValueDuration =

  var decoder = JsonDecoder();

  var prefs = await SharedPreferences.getInstance();
  var allSavedSquats = prefs.getString('squats');

  var stringToMapSquats = decoder.convert(allSavedSquats);
  allSquats = Map<String, dynamic>.from(stringToMapSquats);
}

// function that makes saved items into a string and saves it

Future<bool> saveSquats() async {
  print(allSquats);
  var encoder = JsonEncoder();
  String savedSquatsString = encoder.convert(allSquats);

  var savedSquats = await SharedPreferences.getInstance();
  savedSquats.setString('squats', savedSquatsString);

  return true;
}

addSquat(squatValue) {
  int squatValueSeconds = squatValue.inSeconds;
  Duration hej = Duration(seconds: squatValueSeconds);
  print (hej);
  var today = DateTime.now().toString().substring(0,10);
  if (allSquats['squats'].containsKey(today)){
    allSquats['squats'][today].add(squatValueSeconds);
    print(squatValue.runtimeType);
  } else {
    allSquats['squats'][today] = [squatValueSeconds,];
    print(squatValue.runtimeType);
  }
  print(allSquats);
  saveSquats();
  sumSquats();
  print(sumSquats());
}
