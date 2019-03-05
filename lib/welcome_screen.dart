import 'package:flutter/material.dart';
import 'main.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: Text('Go to main screen!'),
        ),
      ),
    );
  }
}
