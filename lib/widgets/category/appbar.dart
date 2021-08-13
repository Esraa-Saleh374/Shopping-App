import 'package:flutter/material.dart';
import 'package:shopping/widgets/curved_shape.dart';

class ShowappBar extends StatelessWidget {
  final Widget child;
  final int hight;
  const ShowappBar({required this.child, required this.hight});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(.5),
              child: Image.asset(
                'assets/images/wave.png',
                height: hight.toDouble(),
                fit: BoxFit.cover,
                width: double.infinity,
              )),
        ),
        child,
      ],
    );
  }
}
