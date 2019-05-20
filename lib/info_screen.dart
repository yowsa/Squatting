import 'package:flutter/material.dart';
import 'package:squat_mobility/design_elements.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: menuColor,
          title: Text('Info Screen'),
        ),
        body: ListView(
          children: <Widget>[
            InfoSection(
                headline: 'hejsan',
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
          ],
        ));
  }
}

class InfoSection extends StatelessWidget {
  final headline;
  final text;
  final image;

  const InfoSection({
    @required this.headline,
    @required this.text,
    this.image,
  });
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return Center(
      child: Container(
        //height: screenHeight-100,
        //width: screenWidth - 40,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(text),
                    width: screenWidth - 40,
                    padding: EdgeInsets.only(
                        top: 30, right: 20, bottom: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Center(child: Text(headline, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),)),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
