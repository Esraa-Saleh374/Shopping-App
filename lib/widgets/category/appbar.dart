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

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox.fromSize(
      size: preferredSize,
      child: new LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 8;
        return new ClipRect(
          child: new OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: new SizedBox(
              width: width,
              height: width,
              child: new Padding(
                padding: new EdgeInsets.only(
                    bottom: width / 2 - preferredSize.height / 2),
                child: new DecoratedBox(
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
