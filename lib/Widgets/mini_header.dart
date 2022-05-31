import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarifim/product/utility.dart';

class BaslikBarMini extends StatelessWidget {
  final String yazi;
  const BaslikBarMini({Key? key, required this.yazi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ClipPath(
            clipper: WavyClipper1(),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    ColorsUtility().primaryColor,
                    ColorsUtility().thirdColor,
                  ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight)),
            ),
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: ClipPath(
            clipper: WavyClipper2(),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    ColorsUtility().primaryColor,
                    ColorsUtility().thirdColor,
                  ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight)),
            ),
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: ClipPath(
            clipper: WavyClipper3(),
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    ColorsUtility().primaryColor,
                    ColorsUtility().thirdColor,
                  ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 20),
          alignment: Alignment.center,
          height: 80,
          width: double.infinity,
          child: Text(
            yazi,
            style: TextStyle(
                color: ColorsUtility().backgroundColor,
                fontWeight: FontWeight.w600,
                fontFamily: "PlusJakarta",
                fontSize: 25),
          ),
        ),
      ],
    );
  }
}

class WavyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.25), size.height - 80);
    var secondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WavyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 2.35, size.height);
    var firstEnd = Offset(size.width / 1.85, size.height - 30.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 2.75), size.height - 60);
    var secondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WavyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height / 1.5);
    var firstStart = Offset(size.width / 5, size.height / 1.5);
    var firstEnd = Offset(size.width / 2.25, size.height / 1.25);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 2.5), size.height / 1.1);
    var secondEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
