import 'package:flutter/material.dart';
import 'infoScreen.dart';
import 'welcomeScreen.dart';
import 'RoutesWidget.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoRoute()));
            },
            child: Text('hejsan knapp'),
          )),
          Expanded(
            child: RoutesWidget(
              screenName: InfoScreen(),
              buttonName: 'Testknaaaapp',
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfoScreen(),
    );
  }
}

class WelcomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: welcomeRoute(),
    );
  }
}

routes(whichroute) {
  return whichroute;
}
