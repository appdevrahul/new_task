import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background elements
          Positioned(
            top: -109,
            left: 24.5,
            child: Container(
              height: 328,
              width: 157,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            top: 86,
            left: 48,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          Positioned(
            top: 62,
            right: -140,
            child: Container(
              height: 157,
              width: 328,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.purple.shade300],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            top: 230,
            left: -82,
            child: Container(
              height: 140,
              width: 438,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 10,
                      color: Colors.pinkAccent,
                    ),
                    Container(
                      height: 70,
                      width: 10,
                      color: Colors.blueAccent,
                    ),
                    Container(
                      height: 40,
                      width: 10,
                      color: Colors.orangeAccent,
                    ),
                    Container(
                      height: 80,
                      width: 10,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 79  ,
            child: Container(
              height: 120,
              width: 438,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: CustomPaint(
                  painter: LinePainter(),
                  child: Container(),
                ),
              ),
            ),
          ),
          // Text content
          Positioned(
            top: 550,
            bottom: 106,
            left: 52,
            right: 117,
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Create Your\n",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "Tasks",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                        ).createShader(Rect.fromLTWH(0, 0, 100, 20)),
                    ),
                  ),
                  const TextSpan(
                    text: " And\nManage Your Work",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Start button
          Positioned(
            top: 700,
            left: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'HomeScreen');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  "Start  →",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for drawing the curve line
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..shader = const LinearGradient(
        colors: [Colors.purple, Colors.blue],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
