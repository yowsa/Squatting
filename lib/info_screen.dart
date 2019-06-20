import 'package:flutter/material.dart';
import 'package:squat_mobility/design_elements.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: menuColor,
          title: Text('Info'),
        ),
        body: ListView(
          children: <Widget>[
            InfoSection(
                headline: 'GUIDELINES',
                bulletText: Column(
                  children: <Widget>[
                    BulletText(
                      iconTrueFalse: true,
                      text:
                          'The goal is to sit in a resting squat position for a total of 30 minutes each day.',
                      icon: Icons.lens,
                    ),
                    BulletText(
                      iconTrueFalse: true,
                      text:
                          'Split the time up as needed. Start with smaller sessions, such as 30-90 seconds at a time, for the hips to get used to the position.',
                      icon: Icons.lens,
                    ),
                    BulletText(
                      iconTrueFalse: true,
                      text: 'If something hurts, STOP!',
                      icon: Icons.lens,
                    ),
                  ],
                )),
            InfoSection(
                headline: 'WHY SQUAT?',
                bulletText: Column(
                  children: <Widget>[
                    BulletText(
                        text:
                            'Resting in a squat position daily increases hip, ankle and back mobility, which many are lacking due to today’s sitting culture.',
                        iconTrueFalse: false),
                  ],
                )),
            InfoSection(
                headline: 'HOW TO SQUAT',
                bulletText: Column(
                  children: <Widget>[
                    BulletText(
                      text:
                          'Feet roughly shoulder width apart with toes pointing slightly outwards, adjust as needed to comfortably fit your body.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    BulletText(
                      text: 'Relaxed spine.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    BulletText(
                      text: 'Sit as deep as you can.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    BulletText(
                      text: 'Keep your heels on the floor.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    InfoImage(
                      imagePath: 'assets/squat-good-form.jpg',
                    ),
                    InfoImage(imagePath: 'assets/form-heels-up.jpg'),
                  ],
                )),
            InfoSection(
                headline: 'I CAN\'T SQUAT',
                bulletText: Column(
                  children: <Widget>[
                    BulletText(
                      text:
                          'If you can’t squat down low, start slow and work yourself there. ',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    BulletText(
                      text:
                          'If you’re falling backwards, try holding onto something.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    InfoImage(imagePath: 'assets/form-hold-on.jpg'),
                    BulletText(
                      text:
                          'If you can’t get low enough with your heels flat, prop something under your heels such as a rolled up towel or a book.',
                      iconTrueFalse: true,
                      icon: Icons.lens,
                    ),
                    InfoImage(imagePath: 'assets/form-feet-elevated.jpg'),
                  ],
                )),
          ],
        ));
  }
}

class InfoSection extends StatelessWidget {
  final headline;
  final image;
  final bulletText;

  const InfoSection({
    @required this.headline,
    @required this.bulletText,
    this.image,
  });
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          Center(
            child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, right: 25, bottom: 25, left: 25),
                  child: Container(
                    child: bulletText,
                  ),
                ),
                margin: EdgeInsets.all(30),
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)))),
          ),
          Center(
            child: Card(
              color: mainColor,
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: SizedBox(
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    headline,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final icon;
  final text;
  final iconTrueFalse;

  BulletText({
    @required this.text,
    @required this.iconTrueFalse,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
            visible: iconTrueFalse,
            child: Container(
              padding: EdgeInsets.only(top: 7.0, right: 5.0),
              child: Icon(
                icon,
                size: 8.0,
                color: menuColor,
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class InfoImage extends StatelessWidget {
  final imagePath;

  InfoImage({
    @required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var thisImage = AssetImage(imagePath);
    var image = Image(
      image: thisImage,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: image,
      ),
    );
  }
}
