import 'package:flutter/material.dart';

class SecondRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
        },
          child: Text('Goooo back!'),
        ),
      ),
    );
  }
}
