import 'package:flutter/material.dart';
import 'package:time_store/styles/component.dart';

class CustomPaintt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Paint'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: CommonStyle.whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
              child: LayoutBuilder(
                builder: (_, constraints) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF29AAE3),
                  ),
                  width: constraints.widthConstraints().maxWidth,
                  height: 350,
                  child: CustomPaint(painter: FaceOutlinePainter()),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              height: 400,
              color: CommonStyle.whiteColor,
              child: CustomPaint(
                painter: FlagVN(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FlagVN extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = 2 * width / 3;

    final redColor = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), redColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeBlack = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.black54;

    final fill = Paint()
      ..style = PaintingStyle.fill
      ..color = CommonStyle.blackColor;

    final fillWhite = Paint()
      ..style = PaintingStyle.fill
      ..color = CommonStyle.whiteColor;

    final nose = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    //Eyes
    canvas.drawOval(Rect.fromLTWH(85, 40, 100, 100), fillWhite);
    canvas.drawOval(Rect.fromLTWH(size.width - 185, 40, 100, 100), fillWhite);
    canvas.drawOval(Rect.fromLTWH(130, 85, 40, 40), fill);
    canvas.drawOval(Rect.fromLTWH(size.width - 170, 85, 40, 40), fill);
    canvas.drawOval(Rect.fromLTWH(142, 95, 18, 18), fillWhite);
    canvas.drawOval(Rect.fromLTWH(size.width - 160, 95, 18, 18), fillWhite);

    //Nose
    canvas.drawOval(Rect.fromLTWH(165.5, 115, 40, 40), nose);
    canvas.drawOval(Rect.fromLTWH(175, 125, 15, 15), fillWhite);
    canvas.drawOval(Rect.fromLTWH(165.5, 115, 40, 40), strokeBlack);

    //Line from nose to mouth
    final lineNose = Path();
    lineNose.moveTo(size.width * 0.5, 156);
    lineNose.arcToPoint(Offset(size.width * 0.5, size.height * 0.68));
    canvas.drawPath(lineNose, strokeBlack);

    //Beard
    final beard1 = Path();
    beard1.moveTo(size.width * 0.9, size.height * 0.35);
    beard1.arcToPoint(Offset(size.width * 0.65, size.height * 0.42));
    canvas.drawPath(beard1, strokeBlack);

    final beard2 = Path();
    beard2.moveTo(size.width * 0.92, size.height * 0.45);
    beard2.arcToPoint(Offset(size.width * 0.66, size.height * 0.47));
    canvas.drawPath(beard2, strokeBlack);

    final beard3 = Path();
    beard3.moveTo(size.width * 0.9, size.height * 0.55);
    beard3.arcToPoint(Offset(size.width * 0.67, size.height * 0.52));
    canvas.drawPath(beard3, strokeBlack);

    final beard4 = Path();
    beard4.moveTo(size.width * 0.1, size.height * 0.35);
    beard4.arcToPoint(Offset(size.width * 0.35, size.height * 0.42));
    canvas.drawPath(beard4, strokeBlack);

    final beard5 = Path();
    beard5.moveTo(size.width * 0.08, size.height * 0.45);
    beard5.arcToPoint(Offset(size.width * 0.34, size.height * 0.47));
    canvas.drawPath(beard5, strokeBlack);

    final beard6 = Path();
    beard6.moveTo(size.width * 0.1, size.height * 0.55);
    beard6.arcToPoint(Offset(size.width * 0.33, size.height * 0.52));
    canvas.drawPath(beard6, strokeBlack);

    //Mouth
    final mouth = Path();
    mouth.moveTo(size.width * 0.8, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: Radius.circular(100),
    );
    mouth.moveTo(size.width * 0.8, size.height * 0.6);
    mouth.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: Radius.circular(200),
    );
    canvas.drawPath(mouth, strokeBlack);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}
