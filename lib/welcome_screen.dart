import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setVisited() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('newUser', false);


}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            setVisited();
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: Text('Go to main screen!'),
        ),
      ),
    );
  }
}
