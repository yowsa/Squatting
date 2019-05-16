import 'package:flutter/material.dart';
/*
class bottomOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    return rect;
  }
  @override
  bool shouldReclip(CustomRect oldClipper) {
    return true;
    // TODO: implement shouldReclip
  }

}

*/

class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, 200.0);
        //radius:  50.0
   // );
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }

}