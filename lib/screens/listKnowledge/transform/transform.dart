import 'package:flutter/material.dart';
import 'package:time_store/styles/component.dart';
import 'dart:math' as math;

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Transform.rotate(
                angle: -math.pi / 12,
                child: _buildImage(context, 'images/transform-img.jpg'),
              ),
            ),
            const SizedBox(height: 55),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Transform.scale(
                scale: 1.5,
                child: _buildImage(context, 'images/canada.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Transform.scale(
                scale: 0.5,
                child: _buildImage(context, 'images/bali.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String image) {
    return Stack(
      children: [
        Image.asset(image),
        Positioned(
          bottom: 12,
          right: 12,
          child: Text(
            'Switzerland',
            style: CommonStyle.defaultText(context),
          ),
        ),
      ],
    );
  }
}
