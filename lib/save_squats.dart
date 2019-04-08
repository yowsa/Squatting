import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Global variable that holds all squats (dict/map)

Map<String, List<dynamic>> allSquats = {
  "squats": [1],
};

// function that loads saved items at start

loadSquats() async {
  var decoder = JsonDecoder();

  var prefs = await SharedPreferences.getInstance();
  var allSquats3 = prefs.getString('squats');

  var stringToMapSquats = decoder.convert(allSquats3);
  allSquats = Map<String, List<dynamic>>.from(stringToMapSquats);
  print("start of decoder");
  print(allSquats);
}

// function that makes saved items into a string and saves it

Future<bool> saveSquats() async {
  print(allSquats);
  var encoder = JsonEncoder();
  allSquats['squats'].add(1);
  String savedSquatsString = encoder.convert(allSquats);
  print(savedSquatsString);

  var savedSquats = await SharedPreferences.getInstance();
  savedSquats.setString('squats', savedSquatsString);

  print("hejsan");
  print(savedSquatsString);
  print("hejsan");
  return true;
}
