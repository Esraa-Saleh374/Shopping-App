import 'package:flutter/material.dart';

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
              'assets/wave.png',
              height: hight.toDouble(),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
