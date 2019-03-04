import 'package:flutter/material.dart';

class RoutesWidget extends StatelessWidget {
  final screenName;
  final buttonName;

  const RoutesWidget({
    @required this.screenName,
    @required this.buttonName,
  });

  Widget build(BuildContext context) {
    return Material(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screenName));
        },
        child: Text(buttonName),
      ),
    );
  }
}
